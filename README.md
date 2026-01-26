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

http://localhost:5210/

This element in the stack just provides the yasgui sparql editor in the browser.
Be sure to have it point to the correct sparql endpoint. (default `http://localhost:5200/repositories/aphia-sync` should work.)

Compared to the built-in sparql UI in the graphd front-end this has the advantage it can also point to other sparql endpoints.


### jupyter notebooks environment

http://localhost:5220/ 



Direct link to the provided dashboard:

http://localhost:5220/lab/tree/aphia-sync-dashboard.ipynb



TODO add features:
1. count taxnames
2. count taxname strings-histogram per language
3. list taxnames
4. also call the aphia ws for taxname mapping?




! TODO fill in some possible useful blanks:

## ref and explain k-gap usage

## provide some simple and straightforward docker commands for troubleshooting and additional control...

## describe dot-env thingies to set / enable


