import React, { Component } from 'react';
import {Card, ListGroup} from 'react-bootstrap';
import '../../styles/Card.css';
import '../../styles/Listgroup.css';
import _ from 'lodash';

export default class Dash extends Component {
	constructor(props) {
		super(props);
	}

	nestedHelp(nestedValue) {
		return (
			_.toPairs(nestedValue).map((nestedPair, idn) => {
				const nestKey = nestedPair[0];
				const nestVal = nestedPair[1];
				console.log(nestedValue);
				console.log(nestVal);

				return (
					<span key={nestedPair + idn}>
						{nestVal}
					</span>
				);

				//	Create a variable that counts from 1 to 3 and resets after 3. Use it to add formatting unique to each coord. 
				//	x: parentheses, red, comma;  y: blue, comma;  z: green, parantheses

			})
		);
	}

	render() {
		return (
			<Card className="card-custom">
				
				<Card.Title>Dashboard</Card.Title>
				<Card.Body className='card-body-custom'>
					{
						_.toPairs(this.props.data).map((pair, idx) => {
							const rootKey = pair[0];
							const rootValue = pair[1];
							console.log(pair);
							return (
								<ListGroup.Item key={pair + idx} className="listgroup-item-custom">
									
									{rootKey}

									<span className='text-right'>
										{this.nestedHelp(rootValue)}
									</span>

								</ListGroup.Item>
							);
						})
					}
				</Card.Body> 
			</Card>
		);
	}
}