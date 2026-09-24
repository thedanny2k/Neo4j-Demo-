// DEMO Getting familiar with neo4j

// creating items
CREATE (a:Item {name: 'Cathode Powder'})
CREATE (b:Item {name: 'Solvent'})
CREATE (c:Item {name: 'Slurry'})
CREATE (d:Item {name: 'Electrode Sheet 1'})
CREATE (e:Item {name: 'Electrode Sheet 2'})
CREATE (f:Item {name: 'Battery Cell'});

// connecting them to eachother , what makes what
MATCH (a:Item {name: 'Cathode Powder'}), (c:Item {name: 'Slurry'})
CREATE (a)-[:USED_TO_MAKE]->(c);

MATCH (b:Item {name: 'Solvent'}), (c:Item {name: 'Slurry'})
CREATE (b)-[:USED_TO_MAKE]->(c);

MATCH (c:Item {name: 'Slurry'}), (d:Item {name: 'Electrode Sheet 1'})
CREATE (c)-[:USED_TO_MAKE]->(d);

MATCH (c:Item {name: 'Slurry'}), (e:Item {name: 'Electrode Sheet 2'})
CREATE (c)-[:USED_TO_MAKE]->(e);

MATCH (d:Item {name: 'Electrode Sheet 1'}), (f:Item {name: 'Battery Cell'})
CREATE (d)-[:USED_TO_MAKE]->(f);


// Visualize graph 

MATCH (n)-[r]->(m) RETURN n, r, m;

// Sample Queries

// What raw materials went into the Battery Cell?
// MATCH (raw:Item)-[:USED_TO_MAKE*]->(final:Item {name: 'Battery Cell'}) RETURN raw.name;

// What did the Slurry end up becoming?
// MATCH (start:Item {name: 'Slurry'})-[:USED_TO_MAKE*]->(descendant:Item) RETURN descendant.name;
