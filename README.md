# Onboarding Assistant

A Dart/Flutter project to ease newcomers onboarding.

## Getting Started

This project is a proof of concept and do not use real data.
To use it, you will need a backend web service on this form : 

```json
[
    {
      "title": "task title",
      "status": "in progress|complete|not started",
      "description": "task description",
      "subtasks": [
        {
          "title": "subtask title",
          "status": "complete|complete|not started",
          "alert": "optional warning or important message"
        },
        /* {...}, */
      ]
    },
    {
      /* {...}, */
    }
  ]
```
