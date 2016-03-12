# emp-connector
A simplified connector to the Enterprise Messaging Platform


Example usage:

    
    // Replay from the start of the event window
    long replayFrom = Konnnektor.REPLAY_FROM_EARLIEST; 
    
    // get parameters from login
    BayeuxParameters params = login("foo@bar.com", "password");
    
    // The event consumer
    Consumer<Map<String, Object>> consumer = event -> System.out.println(String.format("Received:\n%s", event));
    
    // The EMP connector
    Konnnektor connector = new Konnnektor(params);
    
    // Wait for handshake with Streaming API
    connector.start().get(5, TimeUnit.SECONDS);
    
    // Subscribe to a topic
    // Block and wait for the subscription to succeed for 5 seconds
    TopicSubscription subscription = connector.subscribe("my-topic", replayFrom, consumer).get(5, TimeUnit.SECONDS);
    
    // Here's our subscription
    System.out.println(String.format("Subscribed: %s", subscription));
    
    // Cancel a subscription
    subscription.cancel();
    
    // Stop the connector
    connector.stop();

See [Login Example](https://git.soma.salesforce.com/MessagingPlatform/emp-connector/blob/master/src/test/java/com/salesforce/emp/connector/LoginExample.java) for full example.