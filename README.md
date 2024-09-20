# Chatbot Application

This is a simple chatbot application that provides predefined responses to specific questions about AI technology. The chatbot uses a map of questions and responses to simulate a conversation.

## Bot Responses

The chatbot responds to the following questions with predefined answers:

- **What do you think about AI technology?**  
  Response: "AI technology is revolutionizing various industries, from healthcare to finance!"

- **What’s the most impressive application of AI so far?**  
  Response: "I’d say self-driving cars and natural language processing are at the forefront of AI applications."

- **Can AI replace human jobs?**  
  Response: "AI will automate many tasks, but it will also create new jobs requiring human creativity and problem-solving."

## How to Use

1. **Ask a Question:** Type one of the predefined questions into the chat interface.
2. **Receive a Response:** The chatbot will respond with the corresponding answer from the `botResponses` map.

## Adding More Responses

To add more responses, simply update the `botResponses` map with new questions and answers. For example:

```dart
botResponses["Your Question"] = "Your Response";
```

## Screenshot

![Chatbot Screenshot](s.png)