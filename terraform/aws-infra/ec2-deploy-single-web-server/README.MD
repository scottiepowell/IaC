This is a simple example of deploying a web server on a VPS using a bash script and busybox

prerequisites
1 - amazon account
2 - terraform installed on linux or windows server

overview
what is terraform?

resources/references

endstate
at the end of this tutorial, we'll have a web server that talks over 

step 1
setup the provider, AWS.  This needs to be done only once for most tutorials in terraform and the provider code is copied to a new directoy for a different project.  First, create a file in the root directory named provider.tf and copy/paste the following code, we'll get into what it means in the next step.  

step 2



