function fn() {

  var config = {
    name:'test123',
    myVarName: 'someValue',
    baseUrl1: 'https://gorest.co.in',
    baseUrl2: 'https://reqres.in/api',
    tokenID: '94120e9960c309eae23dc20b5cfce4c7c790e09f2499b11d8446d3d40abff504',
  };

karate.configure('connectTimeout', 5000);
karate.configure('readTimeout', 5000);

  return config;
}




