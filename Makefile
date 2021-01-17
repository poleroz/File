sync:	
	cd ~/WORK/test-build2/
	rm -r www.chiark.greenend.org.uk
	rm -r src
	mkdir src
	wget -mkEpnp https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
build:
	cd ~/WORK/test-build2/
	scp www.chiark.greenend.org.uk/~sgtatham/* src/
	-docker image rm zercalo2
	docker build -t zercalo2 .
	docker save -o zercalo2.tar zercalo2
deploy:
	scp -i ~/.ssh/test-server ~/WORK/test-build2/zercalo2.tar ubuntu@77.223.97.71:~/WORK/test-build2/
	-ssh server-dev-ubuntu "docker kill zercalo2-container"
	-ssh server-dev-ubuntu "docker container rm zercalo2-container"
	-ssh server-dev-ubuntu "docker image rm zercalo2"
	-ssh server-dev-ubuntu "cd ~/WORK/test-build2/ && docker load -i zercalo2.tar && docker run -d -p 90:8090 --name zercalo2-container zercalo2"
