pragma solidity ^0.8.0;

contract Order {

    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status; 

    function ship() public {
        require(status == Status.Pending);
        status = Status.Shipped;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }

    function cancel() public {
        require(status == Status.Pending);
        status = Status.Canceled;
    }
}