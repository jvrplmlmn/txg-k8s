# txg-k8s

### Context

Deploys a simple greeter application to Kubernetes, exposes it via a loadbalancer that automatically provisions and manages TLS certificates from Let's Encrypt.

### Built with

- [Minikube](https://minikube.sigs.k8s.io/docs/) to setup a local Kubernetes cluster
- [cert-manager](https://cert-manager.io/docs/) to automatically provision and manage TLS certificates
- [NGINX Ingress Controller for Kubernetes](https://kubernetes.github.io/ingress-nginx/)
- A [greeter](https://github.com/jvrplmlmn/go-greeter) application written in Go


### Includes
- Script boilerplate to manage the environment.
- Kubernetes manifests.

---

### Try it out

Assumes that `minikube` is installed and available. Tested on MacOS.

#### Create the environment

Create the Kubernetes cluster and enable the required addons and additional config.

```
bash scripts/minikube-up.sh
```

#### Provision

Will apply the Kubernetes manifests to ensure that all components are deployed and running.

```
bash scripts/provision.sh
```

#### Test

Verify that the environment is working as expected.

```
bash scripts/test.sh
```

You can verify that the certificate was created by LetsEncrypt looking for the following in the output:

```
* Server certificate:
*  subject: O=Acme Co; CN=Kubernetes Ingress Controller Fake Certificate
*  start date: Jun 13 15:56:12 2020 GMT
*  expire date: Jun 13 15:56:12 2021 GMT
*  issuer: O=Acme Co; CN=Kubernetes Ingress Controller Fake Certificate
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
```

#### Tear it down

Once you are done, you can tear down the environment with:

```
bash scripts/minikube-down.sh
```

---

For more details do not hesitate to contact me :wink: