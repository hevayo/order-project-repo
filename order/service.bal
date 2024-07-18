import ballerina/http;

public type Order record {
    int id;
    Shipper shipper;
    Receiver receiver;
    Item[] items;
    decimal totalValue;
    string status;
    string orderDate;
    string deliveryDate;
    string trackingNumber;
};

public type Shipper record {
    string name;
    string address;
};

public type Receiver record {
    string name;
    string address;
};

public type Item record {
    string name;
    int quantity;
    decimal price;
};

Order[] data = [
    {
        id: 1,
        shipper: {name: "John Doe", address: "123 Shipper St"},
        receiver: {name: "Jane Smith", address: "456 Receiver Ave"},
        items: [
            {name: "Laptop", quantity: 1, price: 1200.00},
            {name: "Mouse", quantity: 2, price: 25.00}
        ],
        totalValue: 1250.00,
        status: "Shipped",
        orderDate: "2022-01-01",
        deliveryDate: "2022-01-05",
        trackingNumber: "TRACK12345"

    },
    {
        id: 2,
        shipper: {name: "Alice Johnson", address: "789 Shipper Blvd"},
        receiver: {name: "Bob Brown", address: "101 Receiver Rd"},
        items: [
            {name: "Phone", quantity: 3, price: 800.00}
        ],
        totalValue: 2400.00,
        status: "Delivered",
        orderDate: "2022-01-02",
        deliveryDate: "2022-01-06",
        trackingNumber: "TRACK12346"
    },
    {
        id: 3,
        shipper: {name: "Charlie Davis", address: "234 Shipper Ln"},
        receiver: {name: "Diana Evans", address: "567 Receiver Dr"},
        items: [
            {name: "Tablet", quantity: 2, price: 500.00}
        ],
        totalValue: 1000.00,
        status: "Processing",
        orderDate: "2022-01-03",
        deliveryDate: "2022-01-07",
        trackingNumber: "TRACK12347"
    },
    {
        id: 4,
        shipper: {name: "Ethan Foster", address: "345 Shipper Ct"},
        receiver: {name: "Fiona Green", address: "678 Receiver Pl"},
        items: [
            {name: "Monitor", quantity: 1, price: 300.00},
            {name: "Keyboard", quantity: 1, price: 50.00}
        ],
        totalValue: 350.00,
        status: "Shipped",
        orderDate: "2022-01-04",
        deliveryDate: "2022-01-08",
        trackingNumber: "TRACK12348"
    },
    {
        id: 5,
        shipper: {name: "George Harris", address: "456 Shipper Ave"},
        receiver: {name: "Hannah White", address: "789 Receiver St"},
        items: [
            {name: "Headphones", quantity: 5, price: 100.00}
        ],
        totalValue: 500.00,
        status: "Delivered",
        orderDate: "2022-01-05",
        deliveryDate: "2022-01-09",
        trackingNumber: "TRACK12349"
    },
    {
        id: 6,
        shipper: {name: "Isaac King", address: "567 Shipper Rd"},
        receiver: {name: "Isabella Lee", address: "890 Receiver Blvd"},
        items: [
            {name: "Camera", quantity: 1, price: 1500.00}
        ],
        totalValue: 1500.00,
        status: "Processing",
        orderDate: "2022-01-06",
        deliveryDate: "2022-01-10",
        trackingNumber: "TRACK12350"
    },
    {
        id: 7,
        shipper: {name: "Jack Martin", address: "678 Shipper Dr"},
        receiver: {name: "Julia Nelson", address: "901 Receiver Ln"},
        items: [
            {name: "Printer", quantity: 2, price: 200.00}
        ],
        totalValue: 400.00,
        status: "Shipped",
        orderDate: "2022-01-07",
        deliveryDate: "2022-01-11",
        trackingNumber: "TRACK12351"
    },
    {
        id: 8,
        shipper: {name: "Kevin Parker", address: "789 Shipper Pl"},
        receiver: {name: "Karen Roberts", address: "123 Receiver Ct"},
        items: [
            {name: "Router", quantity: 3, price: 150.00}
        ],
        totalValue: 450.00,
        status: "Delivered",
        orderDate: "2022-01-08",
        deliveryDate: "2022-01-12",
        trackingNumber: "TRACK12352"
    },
    {
        id: 9,
        shipper: {name: "Liam Scott", address: "890 Shipper St"},
        receiver: {name: "Laura Turner", address: "234 Receiver Ave"},
        items: [
            {name: "Smartwatch", quantity: 4, price: 250.00}
        ],
        totalValue: 1000.00,
        status: "Processing",
        orderDate: "2022-01-09",
        deliveryDate: "2022-01-13",
        trackingNumber: "TRACK12353"
    },
    {
        id: 10,
        shipper: {name: "Mason Walker", address: "901 Shipper Rd"},
        receiver: {name: "Mia Young", address: "345 Receiver Blvd"},
        items: [
            {name: "TV", quantity: 1, price: 2000.00}
        ],
        totalValue: 2000.00,
        status: "Shipped",
        orderDate: "2022-01-10",
        deliveryDate: "2022-01-14",
        trackingNumber: "TRACK12354"
    }
];

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function get orders() returns Order[]|error {
        return data;
    }

    resource function post orders(Order postData) returns Order|error {
        data.push(postData);
        return postData;
    }

    resource function get orders/[int id]() returns Order|error {
        // Logic to retrieve a specific order by ID
        Order 'order = data.filter((o) => o.id == id)[0];
        return 'order;
    }

    resource function put orders/[int id](Order putData) returns error? {

    }

    resource function delete orders/[int id](http:Caller caller) returns error? {

    }
}
