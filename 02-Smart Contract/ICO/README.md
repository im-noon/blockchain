## Initial Coin Offering (ICO)
### What is ICO?

- An <span style="color: red">initial coin offering (ICO)</span> is atype of crowdfunding using cryptocurrencies.
- An ICO can be a source if capital for startup companies that offer investors some unit of  a new cryptocurrency or cryto-token in exchange againt cryptocurrencies like Bitcoin or Ethereum.
- The first ICO(also know as token sell) was held by Mastercoin in July 2013. <span style="color: red">Ethereum raised money with a token sell in 2014,</span> raising 3700 BTC in the first 12 hours, equal to approximately $2.3 million at that time.
- **Who can launch an ICO? Literally anyone!** Currently, there's very little regulation on ICOs around the world, meaning as long as you can get the tech setup you're free to try and get your project funded.
- <span style="color: red">Before launching an ICO it's mandatory to verify and obey the laws of countries your investors are coming from!</span>


## ICO Planing and design
- <span style="color: red">Our ICO will be a smart contract that accepts Ether in exchange of our own token named Cyptos(CPRT)</span>
- The Cryptos token is an fully-complient ERC20 token and will be generated at the ICO deployment time.
- Investors will **send ETH to the ICO contract address** and in return they'll get an amount of Crytos.
- **There will be a deposit address(EOA account) that automatically receives the ETH sent to the ICO contract**.
- CRPT token price in wei is: 1 CRPT = 0.001 ETH = 10^15 wei, 1ETH = 1000 CRPT.
- The <span style="color: red">minimum investment</span> is 0.01 ETH and the <span style="color: red">maximum investment</span> is 5 ETH.
- The ICO <span style="color: red">Hardcap</span> is 300 ETH.
- The ICO has an admin that specifies when the ICO starts and ends.
- The ICO ends when the Hardcap or the end time is reached(what come first).
- The CRPT token <span style="color: red">will be tradable only after</span> a time set by the admin.
- **The admin could in case of emergency half the ICO and also change the deposit address.**
- The ICO can be in one of thefollowing <span style="color: red">states:beforeStart, Running, afterEnd, halted</span>.
- After an investment in the ICO, the <span style="color: red">invest</span> event will be emitted.
