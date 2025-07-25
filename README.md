# Acme Widget Basket System

## Overview

This is a proof-of-concept implementation of the basket system for Acme Widget Co. The system supports:

* Adding products to a basket
* Applying special offers
* Calculating total including delivery charges

## Features

* **Product Catalogue**: Three products supported - Red, Green, and Blue widgets
* **Offer Rules**: "Buy one red widget (R01), get the second half price"
* **Delivery Charges**:

  * Orders under £50: £4.95
  * Orders £50-£89.99: £2.95
  * Orders £90 and above: Free

### 🧮 Calculation Assumptions
- Float arithmetic with 2-decimal rounding
- Total = (subtotal - discounts) + delivery charge

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/acme_widget_basket.git
cd acme_widget_basket
bundle install
```

## Running Tests

```bash
bundle exec rspec
```
## 🚀 Run Code
```bash
bundle exec ruby main.rb
```

## Assumptions

* Only one offer type is active (R01 BOGO half-price)
* Delivery charges apply after offers are applied
* Rounding is done to 2 decimal places (standard currency rounding)

## Tech Stack

* Ruby
* RSpec for testing

---

This solution is built to be readable, testable, and easy to extend with new offers or pricing rules.
