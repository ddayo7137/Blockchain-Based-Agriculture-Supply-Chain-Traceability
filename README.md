# Blockchain-Based Agriculture Supply Chain Traceability

A comprehensive blockchain solution for tracking agricultural products from farm to consumer, ensuring transparency, authenticity, and food safety throughout the entire supply chain.

## Overview

This system provides end-to-end traceability for agricultural products using smart contracts built on the Stacks blockchain with Clarity. The solution enables consumers to trace their food back to its origin while providing all stakeholders with transparent and immutable records.

## Architecture

The system consists of five interconnected smart contracts:

### 1. Producer Verification Contract (`producer-verification.clar`)
- **Purpose**: Validates and manages agricultural producers
- **Key Features**:
    - Producer registration and verification
    - Certification tracking
    - Location and credential management
    - Verification status monitoring

### 2. Crop Tracking Contract (`crop-tracking.clar`)
- **Purpose**: Tracks agricultural crops from planting to harvest
- **Key Features**:
    - Crop planting documentation
    - Growth monitoring
    - Harvest recording
    - Organic certification tracking
    - Yield management

### 3. Processing Documentation Contract (`processing-documentation.clar`)
- **Purpose**: Documents food processing steps and quality control
- **Key Features**:
    - Processing facility documentation
    - Batch number tracking
    - Quality grade assignment
    - Certification compliance
    - Processing date and method recording

### 4. Distribution Coordination Contract (`distribution-coordination.clar`)
- **Purpose**: Coordinates food distribution and logistics
- **Key Features**:
    - Transportation method tracking
    - Temperature control monitoring
    - Delivery status updates
    - Tracking number management
    - Route documentation

### 5. Consumer Information Contract (`consumer-information.clar`)
- **Purpose**: Provides comprehensive food information to consumers
- **Key Features**:
    - Product information display
    - Nutritional data
    - Allergen information
    - Storage instructions
    - Complete traceability chain
    - QR code integration

## Key Benefits

### For Consumers
- **Complete Transparency**: Track food from farm to table
- **Food Safety**: Verify authenticity and safety standards
- **Informed Choices**: Access to nutritional and allergen information
- **Quality Assurance**: View quality grades and certifications

### For Producers
- **Brand Trust**: Build consumer confidence through transparency
- **Premium Pricing**: Justify higher prices with verified quality
- **Compliance**: Meet regulatory requirements automatically
- **Market Access**: Reach quality-conscious consumers

### For Retailers
- **Supply Chain Visibility**: Monitor entire supply chain
- **Risk Management**: Quickly identify and isolate issues
- **Compliance**: Automated regulatory compliance
- **Customer Satisfaction**: Provide detailed product information

### For Regulators
- **Audit Trail**: Complete immutable records
- **Rapid Response**: Quick identification of contamination sources
- **Compliance Monitoring**: Real-time compliance verification
- **Data Integrity**: Tamper-proof record keeping

## Technical Features

### Blockchain Benefits
- **Immutability**: Records cannot be altered once written
- **Transparency**: All stakeholders can verify information
- **Decentralization**: No single point of failure
- **Trust**: Cryptographic verification of all data

### Smart Contract Features
- **Automated Verification**: Automatic validation of data integrity
- **Access Control**: Role-based permissions for different stakeholders
- **Event Logging**: Comprehensive audit trails
- **Integration Ready**: APIs for external system integration

## Installation and Setup

### Prerequisites
- Stacks blockchain node
- Clarity development environment
- Node.js for testing

### Deployment Steps

1. **Clone the Repository**
   \`\`\`bash
   git clone <repository-url>
   cd agriculture-supply-chain
   \`\`\`

2. **Install Dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Deploy Contracts**
   \`\`\`bash
   # Deploy in order due to dependencies
   clarinet deploy contracts/producer-verification.clar
   clarinet deploy contracts/crop-tracking.clar
   clarinet deploy contracts/processing-documentation.clar
   clarinet deploy contracts/distribution-coordination.clar
   clarinet deploy contracts/consumer-information.clar
   \`\`\`

4. **Run Tests**
   \`\`\`bash
   npm test
   \`\`\`

## Usage Examples

### Register a Producer
\`\`\`clarity
(contract-call? .producer-verification register-producer
"Green Valley Farm"
"California, USA"
"USDA Organic")
\`\`\`

### Plant a Crop
\`\`\`clarity
(contract-call? .crop-tracking plant-crop
u1
"Tomato"
"Cherry"
u1000
"Field A"
true)
\`\`\`

### Document Processing
\`\`\`clarity
(contract-call? .processing-documentation document-processing
u1
"Fresh Foods Inc"
"Washing"
"Processing Plant A"
"BATCH001"
"A"
"FDA, USDA")
\`\`\`

## API Reference

### Producer Verification
- `register-producer(name, location, certification)` - Register new producer
- `verify-producer(producer-id)` - Verify producer credentials
- `get-producer(producer-id)` - Get producer information
- `is-producer-verified(producer-id)` - Check verification status

### Crop Tracking
- `plant-crop(producer-id, crop-type, variety, quantity, location, organic)` - Record crop planting
- `harvest-crop(crop-id, actual-quantity)` - Record harvest
- `get-crop(crop-id)` - Get crop information
- `get-crop-status(crop-id)` - Get current crop status

### Processing Documentation
- `document-processing(...)` - Record processing step
- `get-processing-record(record-id)` - Get processing details
- `get-processing-by-crop(crop-id)` - Get processing history for crop

### Distribution Coordination
- `start-distribution(...)` - Begin distribution tracking
- `complete-distribution(distribution-id)` - Mark delivery complete
- `get-distribution-record(distribution-id)` - Get distribution details
- `get-distribution-status(distribution-id)` - Get current status

### Consumer Information
- `create-product-info(...)` - Create consumer-facing product info
- `get-product-info(product-id)` - Get product details
- `get-full-traceability(product-id)` - Get complete traceability chain
- `is-product-expired(product-id)` - Check expiration status

## Testing

The project includes comprehensive test suites for all contracts:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test producer-verification
npm test crop-tracking
npm test processing-documentation
npm test distribution-coordination
npm test consumer-information
\`\`\`

## Security Considerations

- **Access Control**: Only authorized parties can modify records
- **Data Validation**: All inputs are validated before storage
- **Immutability**: Records cannot be deleted or modified after creation
- **Transparency**: All actions are publicly auditable

## Future Enhancements

- **IoT Integration**: Automatic data collection from sensors
- **Mobile App**: Consumer-facing mobile application
- **Analytics Dashboard**: Real-time supply chain analytics
- **Multi-chain Support**: Integration with other blockchains
- **AI Integration**: Predictive analytics and quality assessment

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation wiki

## Acknowledgments

- Stacks blockchain community
- Clarity language developers
- Agricultural industry partners
- Food safety organizations
  \`\`\`
