// Dados que serão enviados no corpo da requisição
const data = {
  "name": " lucas123",
  "email": "  testelucas17@gmail.com",
  "password": " lucas123",
};

// URL da API
const apiUrl = "http://54.147.151.107:8000/users/";

// Opções da requisição (método, cabeçalhos, corpo)
const options = {
  method: 'POST', // O método HTTP para criar um recurso é POST
  headers: {
    'Content-Type': 'application/json', // Informa que o corpo da requisição é um JSON
  },
  body: JSON.stringify(data), // Converte o objeto JavaScript em uma string JSON
};

// Faz a requisição para a API usando fetch()
fetch(apiUrl, options)
  .then(response => {
    // Verifica se a resposta foi bem-sucedida (status 200-299)
    if (!response.ok) {
      // Se não for bem-sucedida, lança um erro com o status
      throw new Error(`Erro na requisição: ${response.status}`);
    }
    // Analisa a resposta como JSON
    return response.json();
  })
  .then(responseData => {
    // Lida com os dados da resposta (se a requisição for bem-sucedida)
    console.log('Dados recebidos da API:', responseData);
  })
  .catch(error => {
    // Lida com qualquer erro que tenha ocorrido durante a requisição ou o processamento
    console.error('Houve um problema com a operação de fetch:', error);
  });