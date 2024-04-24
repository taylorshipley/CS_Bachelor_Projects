import './App.css';
import NavBar from './NavBar';

function App() {
  const title = 'Welcome to the new blog';
  const likes = 50;
  // const person = { name: 'yoshi', age: 30 };
  return (
    <div className="App">
      <NavBar />
      <div className="content">
        <h1>{ title }</h1>
        <p>Liked { likes } times</p>

        {/* <p>{ person }</p> */}
        {/* <p>{ 10 }</p> */}
        {/* <p>{ "hello, ninjas" }</p> */}
        {/* <p>{ [1,2,3,4,5] }</p> */}
        {/* <p>{ Math.random() * 10 }</p> */}

        {/* <a href={ "http://www.google.com" }>Google Site</a> */}
      </div>
    </div>
  );
}

export default App;
