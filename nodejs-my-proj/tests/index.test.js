// File: tests/index.test.js

const request = require('supertest');
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  const html = `
    <html>
      <head>
        <style>
          body {
            background-color: blue;
          }
        </style>
      </head>
      <body>
        <h2>Hello World!</h2>
      </body>
    </html>
  `;

  res.send(html);
});

test('GET / should return an HTML response with "Hello World!"', async () => {
  const response = await request(app).get('/');
  expect(response.status).toBe(200);
  expect(response.text).toContain('<h2>Hello World!</h2>');
});


