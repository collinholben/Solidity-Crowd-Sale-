// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale{

    constructor(
        // @TODO: Fill in the constructor parameters!
        address payable wallet,
        uint rate,
        PupperCoin Token,
        uint StartTime,
        uint EndTime,
        uint goal
    )
        // @TODO: Pass the constructor parameters to the crowdsale contracts.
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(goal)
        TimedCrowdsale(StartTime, Endtime)
        RefundableCrowdsale(goal)
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;

    constructor(
        // @TODO: Fill in the constructor parameters!
        string memory name,
        string memory symbol,
        address payable wallet,
        uint goal 
    )
        public
    {
        // @TODO: create the PupperCoin and keep its address handy
        PupperCoin Token = new PupperCoin(name, symbol, 0); 
        token_address = address(Token);
        // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        PupperCoinCrowdsale pupper_sale = new PupperCoinCrowdsale(
            1,
            wallet,
            token,
            now,
            now + 24 weeks,
            goal
            );
        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}