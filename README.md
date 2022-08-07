# packer-aws-laravel
Packer project to configure and deploy Laravel project on AWS

### Prerequisite
Zip your Laravel project folder and add it in the root directory, make sure to update the name of the project folder and zip file as required.


### Usage
#### Authenticate AWS Account
export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"

export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"

#### Packer Deployment
Initialize your Packer configuration

``
packer init .
``

Format and validate your Packer template

``
packer fmt .
``

``
packer validate .
``

Build Packer image

`` packer build aws-ubuntu.pkr.hcl ``


Visit the AWS AMI page to verify that Packer successfully built your AMI.

#### Managing the Image
Packer only builds images. It does not attempt to manage them in any way. After they're built, it is up to you to launch or destroy them as you see fit.
After running the above example, your AWS account now has an AMI associated with it. AMIs are stored in S3 by Amazon so you may be charged.
You can remove the AMI by first deregistering it on the AWS AMI management page. Next, delete the associated snapshot on the AWS snapshot management page.