package com.ruoyi.framework.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketStompConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        // Messages sent to these prefixes will be handled by the simple broker.
        registry.enableSimpleBroker("/topic", "/queue");

        // Messages sent by clients to this prefix will be routed to @MessageMapping handlers.
        registry.setApplicationDestinationPrefixes("/app");

        // Prefix used to identify user-specific destinations.
        registry.setUserDestinationPrefix("/user/");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // WebSocket handshake endpoint.
        registry.addEndpoint("/ws")
                // Use setAllowedOriginPatterns for wildcard origins in modern Spring.
                .setAllowedOriginPatterns("*")
                // Optional: enable SockJS fallback for older browsers / restricted networks.
                .withSockJS();
    }
}
