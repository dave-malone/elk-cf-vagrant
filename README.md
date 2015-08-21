A Vagrant box provisioned with ELK and preconfigured for use to act as a syslog drain for Cloud Foundry


To use this, simply run `vagrant up`

Kibana will be accessible on your host from your browser at http://localhost:5601/


TODO - add steps for modifying the bosh-lite deployment manifest to forward syslogs to this ELK setup