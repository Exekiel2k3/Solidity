pragma solidity ^0.4.24;

contract Lottery{

	enum Status {open, close}

	struct Bet{
		address gambler;
		uint8[6] gamblerNumbers;
		uint16 amount; //65.536
		uint16 betId;
	}

	struct LotteryGame {
		uint8[6] numbers;
		address owner;
		uint16 numberOfBet; //65.536
		uint16 jackpot; //65.536
		// Ver como manejar la fecha de finalizacion
		mapping (uint16 => Bet) bets; //numberOfBet => Bet
		uint16 lotteryGamesId; //65.536
		Status lotteryStatus;
	}
	
	mapping (uint16 => LotteryGame) lotteryGames; //lotteryGamesId => LotteryGame
	uint16 numberOfLottery;
	
	
	modifier notAdressCero(){
        require(msg.sender != address(0));
        _;
    }
	
	modifier notLotteryOwner(uint16 _id){
        require(msg.sender != lotteryGames[_id].owner);
        _;
    }
	
	modifier lotteryIsOpen(uint16 _id){
		require(lotteryGames[_id].lotteryStatus != Status.close);
		_;
	}
	
	
	/**
	 * @dev Constructor del contrato Lottery
	 */
	constructor () public{
		numberOfLottery = 0;
	}
	
	function newLotteryGame(uint16 _jackpot) public notAdressCero returns (uint16 _lotteryGamesId){
		uint8[6] storage _numbers;
		lotteryGames[++numberOfLottery] = LotteryGame({numbers: _numbers ,owner: msg.sender, numberOfBet: 0, jackpot: _jackpot, lotteryGamesId: numberOfLottery, lotteryStatus: Status.open});
		return numberOfLottery;
	}
	
	function newBet(uint8[6] _numbers, uint8 _amount, uint16 _lotteryGamesId) public notAdressCero notLotteryOwner(_lotteryGamesId) lotteryIsOpen(_lotteryGamesId) returns(uint16 _betId){
		LotteryGame storage lottery = lotteryGames[_lotteryGamesId];
		uint16 betId = ++lottery.numberOfBet;
		lottery.bets[betId] = Bet(msg.sender, _numbers, _amount, betId);
		return betId;
	}
	
	function raffle(uint16 _lotteryGamesId) notAdressCero notLotteryOwner(_lotteryGamesId) lotteryIsOpen(_lotteryGamesId) {
		
		
		
	}

}
