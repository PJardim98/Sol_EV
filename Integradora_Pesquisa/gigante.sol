pragma solidity >=0.7.0 <0.9.0;

contract gigante{
enum AgreState {NotCreated, Created, HasOffer, Estalished, ReadyForPayment, ReportNotOk}

struct Auction {
    uint nbBid;
    SealedBid[] bids;
 }

struct SealedBid{
    address bidder; 
    bytes32 bid;
}

struct Agreement{
    address buyer; 
    address seller;
    uint amount;
    uint buyerMaxPrice; 
    uint price;
    Auction auction;
    AgreState state;
}

mapping(uint => Agreement) public agreements;

function createReq(uint amount, uint price, uint time, uint aucTime)public payable{
    //uint aucId = totalAuction++;
    storeAndLogNewReq(msg.sender, aucId, amount, price, price, time, aucTime);
}

function makeSealedOffer(uint aucId, SealedBid sealedBid)public payable{
    auctionExit(aucId);
    auctionNotClosed(aucId);
    revealNotEnded(aucId)
    {
        agreements[aucId].auction.bids.push(SealedBid(msg.sender, bytes32 bid));
        agreements[aucId].auction.nbBid ++;
        )
    }
    
}

function revealOffer(uint aucId, uint price, uint bidId)public {
    auctionExit(aucId);
    auctionNotClosed(aucId);
    revealNotEnded(aucId)
    {
        if(agreements[aucId].auction.bids[bidId].bid != keccak256(price)){
            return;
        }

        if(agreements[aucId].state == greState.HasOffer){
            require(price < agreements[aucId].price);
            agreements[aucId.seller] = msg.sender; 
        }
        else{
            require(price <= agreements[aucId].buyerMaxPrice);
            agreements[aucId].price = price;
            agreements[aucId].seller = msg.sender;
            agreements[aucId].state = AgreState.HasOffer;
        }
    }
}

}