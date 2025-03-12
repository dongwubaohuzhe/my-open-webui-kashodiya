@echo off

set "PROJECT_DIR=%CD%"
set "PATH=%PROJECT_DIR\scripts%;%PATH%"
set "TERRAFORM_DIR=%PROJECT_DIR%\terraform"
set "KEYS_DIR=%PROJECT_DIR%\keys"
set "SCRIPTS_DIR=%~dp0"
set "SCRIPTS_DIR=%SCRIPTS_DIR:~0,-1%"

call %TERRAFORM_DIR%\set-tf-output-2-env-var.bat

echo ===== Terraform values set as env vars =====
type %TERRAFORM_DIR%\set-tf-output-2-env-var.bat

echo ===== Shortcuts =====
doskey tfa=%SCRIPTS_DIR%\tf-apply.bat
echo tfa = Terraform apply

doskey sshe=ssh -i %PROJECT_DIR%\keys\private_key.pem -o ConnectTimeout=1200 ec2-user@%ELASTIC_IP%
echo sshe = SSH into EC2

doskey ec2=aws ec2 start-instances --instance-ids %INSTANCE_ID%
echo ec2 = Start EC2

doskey ec2x=aws ec2 stop-instances --instance-ids %INSTANCE_ID%
echo ec2x = Stop EC2

doskey open-webui=start https://%ELASTIC_IP%:7101/
echo open-webui = Opens Open WebUI in Browser

doskey portainer=start https://%ELASTIC_IP%:7102/
echo portainer = Opens Portainer in Browser

doskey jupyterlab=start https://%ELASTIC_IP%:7103/
echo jupyterlab = Opens Jupyter Lab in Browser

doskey code-server=start https://%ELASTIC_IP%:7104/
echo code-server = Opens code-server in Browser

doskey litellm=start https://%ELASTIC_IP%:7105/
echo litellm = Opens LiteLLM in Browser

doskey taint-ec2=cd %TERRAFORM_DIR% $T terraform taint aws_instance.main_instance  

doskey rkh=ssh-keygen -R %ELASTIC_IP%  
echo rkh = Remove known SSH host

title %PROJECT_ID%

doskey sshe=ssh -i %PROJECT_DIR%\keys\private_key.pem ec2-user@%ELASTIC_IP%