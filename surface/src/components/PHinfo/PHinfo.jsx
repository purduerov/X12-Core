import React, { Component } from 'react';
import {Card, Button, ListGroup} from 'react-bootstrap';
import '../../styles/Card.css';
import '../../styles/Listgroup.css';

export default class PHinfo extends Component {
	constructor(props) {
		super(props);

		this.freeze = this.freeze.bind(this);
	}

	freeze() {
		this.setState({
			isUpdating: !this.state.isUpdating
		});
	}

	render() {
		return (
			<Card className={`card-custom ${this.props.className}`}>
				<Card.Title>pH and Temperature</Card.Title>
				<Card.Body className='card-body-custom'>
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className='listgroup-item-custom'>
                            pH:<span className='text-right'>{this.props.ph}</span>
						</ListGroup.Item>
						<ListGroup.Item className='listgroup-item-custom'>
                            Temperature:<span className='text-right'>{this.props.temp}</span>
						</ListGroup.Item>
					</ListGroup>
				</Card.Body>
				<Button variant='primary' onClick={this.freeze}>Freeze/Unfreeze Display</Button>     
			</Card>
		);
	}
}
