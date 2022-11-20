# Mkdocs.  # took 4 hours
```
this is a mkdocs task that l have accomplished via dockerfile and jenkinsfile.
```
first creating docker image "docker build -t mkdocs:${TAGS} ."
Second run command "docker run -d -p 8000:8000 mkdocs:${TAGS}"
go to browser and type localhost:8000

## second way of deploying mkdocs project

go to your jenkins server , create new job, select pipeline 
configure with git repo https://github.com/armer2016/Mkdocs.git (it is a public repo, no need credentials).
make sure you have a right path as Jenkinsfile.
build the job.

following link > https://github.com/armer2016/Mkdocs/commits/main
indicates how many commits l have done for mkdocs project.

this error:

Failed to connect to repository : Command "git ls-remote -h git@bitbucket.org:person/projectmarket.git HEAD" returned status code 128:
stdout:
stderr: Host key verification failed.
fatal: The remote end hung up unexpectedly


this is troubleshoot:

1)Execute following commands on terminal
 sudo su -s /bin/bash jenkins
2)Generate public private key using the following command:
 ssh-keygen
you can see output as ::

Generating public/private rsa key pair. 
Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): 
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
3)Press Enter --> Do not give any passphrase--> press enter
Key has been generated
4) go to --> cat /var/lib/jenkins/.ssh/id_rsa.pub
5) Copy key from id_rsa.pub
6)Exit from bash
7) ssh@yourrepository
8) vi .ssh/authorized_keys
9) Paste the key
10) exit
Note: Pls do manually login otherwise jenkins will again give error "host verification failed"
12)once manually done, Now go to Jenkins and give build

