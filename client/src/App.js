import React, { useEffect, useState } from 'react'

const App = () => {
  const [message, setMessage] = useState('')

  useEffect(() => {
    fetch('http://localhost:5000/')
      .then(data => data.json())
      .then(response => setMessage(response.key))
  })

  return <div>hello, {message}</div>
}

export default App
