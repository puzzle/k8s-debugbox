# k8s-debugbox

k8s-debugbox is a tool for debugging Kubernetes pods based on minimal images.
It works by copying statically linked tools, including a shell, into the pods you want to debug.

## Requirements

Kubernetes cluster:
* k8s-debugbox has no special requirements towards Kubernetes clusters

Client:
* Bash 3 or later
* [kubectl (Kubernetes client)](https://kubernetes.io/docs/tasks/tools/install-kubectl/) or [oc (OpenShift client)](https://docs.okd.io/latest/cli_reference/get_started_cli.html)

Most modern operating systems already come with Bash 3 or later. However on Windows you have to get it by either installing the full version of [Cmdr](http://cmder.net/) or [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (Windows 10 only).

## Installation

1. Download a [k8s-debugbox release](https://github.com/puzzle/k8s-debugbox/releases)
2. Extract the downloaded file
3. Change into the created directory
4. Run `install.sh` (`install.bat` on Windows)

## Usage

```sh
$ k8s-debugbox --help
Debug pods based on minimal images.

Examples:
  # Open debugging shell for the first container of the specified pod,
  # install debugging tools into the container if they aren't installed yet.
  k8s-debugbox pod hello-42-dmj88

  # Open debugging shell for container 'proxy' of tje specified pod,
  # install debugging tools into the container if they aren't installed yet.
  k8s-debugbox pod hello-42-dmj88 -c proxy

  # Install debugging tools into specified pod.
  k8s-debugbox pod hello-42-dmj88 --add

  # Uninstall debugging tools from specified pod.
  k8s-debugbox pod hello-42-dmj88 --remove

  # Open debugging shell for the first container of the first pod of the specified controller,
  # install debugging tools into all containers of the controller if they aren't installed yet.
  # Requires a redeployment.
  k8s-debugbox deployment hello

  # Uninstall debugging tools from specified controller.
  # Requires a redeployment.
  k8s-debugbox deployment hello --remove

Options:
  -c, --container='': Container name to open shell for, defaults to first container in pod
  -h, --help: Show this help message
      --add: Install debugging tools into specified resource
      --remove: Remove debugging tools from specified resource

Usage:
  k8s-debugbox TYPE NAME [options]
```

A redeployment is necessary if you install the debugging tools into a controller (e.g. Deployment, DeploymentConfig, CronJob, StatefulSet, DaemonSet), which is triggered automatically unless disabled (triggering can only be disabled in OpenShift DeploymentConfigs).

## Developing

To start developing on k8s-debugbox itself you just have to clone the [k8s-debugbox repository](https://github.com/puzzle/k8s-debugbox), enter the created directory and run the `bootstrap.sh` script, which will download the statically compiled debugging tools using curl.
