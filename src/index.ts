import express from 'express';

const app = express();
const port = process.env.PORT || 3000;

app.get('/status', (_, res) => {
  res.json({ ok: true, message: 'Erana API online' });
});

app.listen(port, () => {
  console.log(`Erana API listening on port ${port}`);
});
