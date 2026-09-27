# example-node

Express through the Node buildpack.

`engines.node` pins Node 22: the newest release needs `libatomic`, which the base run image does not carry.
