
# Kyma Listener

Listener component that listens to events sent by the Kyma [watcher](https://github.com/kyma-project/kyma-watcher) component.

## Overview

Typically, we use the listener module with operators built using Kubebuilder, but we can use it for other operators as well.

### Use

1. For operators built using the kube-builder framework, you might leverage your `SetupWithManager()` method to initialize the listener by calling `RegisterListenerComponent()`.

2. You might also setup your controller to watch for changes sent through the `source.Channel{}` returned by the listener component and react to them calling the `(blder *Builder) Watches()` method and providing your `handler.EventHandler` implementation.

3. The last step is to start the listener, which is accomplished by adding the listener as a runnable to your controller-manager. This is done by calling `mgr.Add()` and passing the listener returned by `RegisterListenerComponent()`.


### Sample code

```golang
    //register listener component
	runnableListener, eventChannel := listener.RegisterListenerComponent(listenerAddr, strings.ToLower(v1alpha1.KymaKind))

	//watch event channel
	controllerBuilder.Watches(eventChannel, &handler.EnqueueRequestForObject{})
	
    //start listener as a manager runnable
	mgr.Add(runnableListener)
```