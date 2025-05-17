Feature: Mock de l'API /articles

  Scenario: pathMatches('/articles')
  * def validToken = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
  * def articles = 
  """
  [
    { "id": "12345", "name": "brush" },
    { "id": "67890", "name": "pen" }
  ]
  """

  * def responseStatus = 200
  * def response = articles