# Ubuntu Focal with Supervisor

This example Dockerfile will allow you to run an Ubuntu container with supervisor to manage services.

Supervisor has been configured to load service files from /etc/supervisor.d/*.service. Service files need to be created for each service you would like to manage. This example will install and manage the SSHD service.