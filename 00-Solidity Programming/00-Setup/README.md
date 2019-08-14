## INSTALLING SOLIDITY AND REMIX IDE ON MACOS

Remix IDE is a really handy development tool to assist the development of solidity smart contract programs.


### PREREQUISITIES
Please make sure python2 was installed on your system.

### INSTALL SOLIDITY USING BREW
    brew tap ethereum/ethereum
    brew install solidity

Then you have the environment to get started with the smart contract programming.

### INSTALL REMIX IDE
You are now going to use node.js. Install node's web server globally if you have not yet.

    npm install -g http-server

Then install remix ide.

    npm install remix-ide -g

Run the remix ide.

    remix-ide

Open the web browser and access to http://localhost:8080. You might have a conflict of the port which prevents the remix IDE from launching. You will need to change either node web server or that of another service using the port.
