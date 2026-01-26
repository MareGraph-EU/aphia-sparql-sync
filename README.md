# aphia-sparql-sync

## UPFRONT: important known limitations & issues

This is hyper-recent and new work (started 2026-01-26) -- use with caution and feel free to report issues (preferably after checking the list of known issues at github)

We are (and you should be) aware off:

* getting the full ldes synchronised needs more investigation (could be due to limited laptop resources)
* implementing an actual lookup by (partial) name should be added to the ipynb dashboard
* and the results from that should be compared to using the aphia-webservice
* would be nice to make it easy to use an external (not embede graphdb) sparql-endpoint
* and better docker-child-management support in ldes-consumer should be considered through testcontainers


## getting started

This stack depends you have a docker + docker-compose running on the environment where you run this.

With those dependencies in place:

* checkout `git clone` this repo, and move `cd ./aphia-sparql-sync` into the created folder
* clone and modify the env settings `./bin/initenv.sh` and `vi .env`
* get all needed docker images through `docker compose pull`
* get the stack started with `./bin/msup.sh`
* check the output for indications that all launched as expected: 
  * there is a known timing issue with graphdb on initial start (on some slower platforms)
  * if this plays up: just restart the previous command -- on second run all should be well
  
Optionally you can 
* keep an eye open on the logs with `./bin/mslogs.sh`

Closing up after working on this, you might want to:
* shutdown the stack with `./bin/msdwn.sh`

The stack remebers state and earlier harvested results.



## using the stack

When the microservices are running you can interact with them through your browser:

### triplestore graphdb 

[GRAPHDB @5200](http://localhost:5200) provides the UI of the embedded graphdb instance.


### yasgui 

[YASGUI @5210](http://localhost:5210/) provides the popular yasgui sparql editor in the browser.

Be sure to have it point to the correct sparql endpoint. (default `http://localhost:5200/repositories/aphia-sync` should work.)

Compared to the built-in sparql UI in the graphd front-end this has the advantage it can also point to other sparql endpoints.


### jupyter notebooks environment

[JUPYTER @5220](http://localhost:5220/) provides a local jupyter notebook instance within the docker-networking stack.  This means it can directly access the sparl endpoint on the graphdb service.

In combination with a handy jinja-templating-for-sparql feature of the [py-sema]() library loaded into this python stack we allow for quick and easy analysis of the harvested graph.

For convenience we provide one `[./notebook/aphia-sync-dashboard.ipynb](http://localhost:5220/lab/tree/aphia-sync-dashboard.ipynb)` that provides the features:

1. counting the aphia-related objects in the graph
2. list and inspect predicates of available taxname objects
3. (todo) lookup taxname `<uri>` by scientific name
4. (todo) compare that result with what can be retrieved by [webservice cals](https://marinespecies.org/aphia.php?p=webservice)



## ref and explain stuff used here.

This stack builds on a number of other projects worth exploring:
* [k-gap](https://github.com/vliz-be-opsci/k-gap) the basic docker-based python-analysis platform for knowledge graphs we are reusing here.
* [py-sema](https://github.com/vliz-be-opsci/py-sema) a python library adding convenience to scientic research tapping into knowldge graphs and semantics (works on top of py-rdflib and others...)
* [ldes2sparql](https://github.com/rdf-connect/ldes2sparql) an application of the [rdfconnect](https://github.com/rdf-connect) platform tuned to materialise LDES feeds into a SPARQL endpoint


## configuration and customisation through `.env`

See the comments in the `dot-env-example` as well as the `docker-compose.yml` for tuning specific settings.




