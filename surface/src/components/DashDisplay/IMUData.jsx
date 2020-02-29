import React, { Component } from 'react';
import {Card, Button, ListGroup} from 'react-bootstrap';
import '../../styles/Card.css';
import '../../styles/Listgroup.css';

export default class Dash extends Component {
	constructor(props) {
		super(props);
	}
    
	render() {
		return (
			<Card className="card-custom">
				
				<Card.Title>Dashboard</Card.Title>

				<Card.Body className='card-body-custom'>
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className="listgroup-item-custom">
							for (let index = 0; index < array.length; index++) {
                                const name = array[index];
                                
                                {name}
                                
                                for (let index = 0; index < array.length; index++) {
                                    const keyValue = array[index];
                                    
                                    <span className='text-right'>
                                    {keyValue}
                                    </span>
                                }
                            }
						</ListGroup.Item>
					</ListGroup>
				</Card.Body>   

			</Card>
		);
	}
}
