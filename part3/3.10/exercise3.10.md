Dockerfile1 is the Dockerfile before and Dockerfile2 is the Dockerfile after the optimizations.

Let's opitimize the example Java Spring project from the course material. 

1. Let us ensure the container does not run as root - we do the user configurations shown in the material. amazoncorretto seems to run on amazonlinux, which contains a fairly minimal set of packages, so we need to download useradd by using yum, in order to add a new user. Alternatively we could use an existing user such as 'nobody'. We can verify the user has been changed by executing bash inside the container.

2. The image size is currently 803 MB. First we reduce all the RUN commands into a single layer. This does not change the image size much, the image size is still 803 MB. We don't have much extra in the container, so this is all we do in this step.

3. Next, let us switch the base image from amazoncorretto:8 (132 MB) to amazoncorretto:8-alpine (99 MB). This will reduce the size a little, and actually simplifies the image even further, since now we can use Alpine Linux's commands for managing users instead of what we described above and there is no need to install useradd. The image size after this is 292 MB.

4. Since we are using amazoncorretto, we are using a pre-installed environment of OpenJDK. As a last step, let us do a multi-stage build for the image, even though we are not really executing a simple binary. The idea is to copy only the executable .jar-file to the last stage and execute it. With this last step we get the image size down to 225 MB.
