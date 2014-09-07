var named = require('node-named');
var server = named.createServer();
var ttl = 300;

server.listen(9999, '127.0.0.1', function() {
  console.log('DNS server started on port 9999');
});

server.on('query', function(query) {
  var domain = query.name();
  var type = query.type();

  console.log('DNS Query: (%s) %s', type, domain);

  switch(type) {
  	case 'A':
  		query.addAnswer(domain, new named.ARecord('127.0.0.1'), 300);
  		break;
  	case 'SOA':
  		query.addAnswer(domain, new named.SOARecord(domain), 300);
  		break;
  }

  server.send(query);
});