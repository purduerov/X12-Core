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
					{this.props.name1}
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.alabel1}<span className='text-right'>{this.props.avalue1}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.alabel2}<span className='text-right'>{this.props.avalue2}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.alabel3}<span className='text-right'>{this.props.avalue3}</span>
						</ListGroup.Item>
					</ListGroup>
				</Card.Body>   

				<Card.Body className='card-body-custom'>
					{this.props.name2}
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.glabel1}<span className='text-right'>{this.props.gvalue1}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.glabel2}<span className='text-right'>{this.props.gvalue2}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.glabel3}<span className='text-right'>{this.props.gvalue3}</span>
						</ListGroup.Item>
					</ListGroup>
				</Card.Body>   

				<Card.Body className='card-body-custom'>
					{this.props.name3}
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.elabel1}<span className='text-right'>{this.props.evalue1}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.elabel2}<span className='text-right'>{this.props.evalue2}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.elabel3}<span className='text-right'>{this.props.evalue3}</span>
						</ListGroup.Item>
					</ListGroup>
				</Card.Body>  

				<Card.Body className='card-body-custom'>
					{this.props.name5}
					<ListGroup variant="flush" className='listgroup-custom'>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.llabel1}<span className='text-right'>{this.props.lvalue1}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.llabel2}<span className='text-right'>{this.props.lvalue2}</span>
						</ListGroup.Item>
						<ListGroup.Item className="listgroup-item-custom">
							{this.props.llabel3}<span className='text-right'>{this.props.lvalue3}</span>
						</ListGroup.Item>
					</ListGroup>
				</Card.Body> 

				<Card.Body className='card-body-custom'>
					{this.props.name4}<span className='text-right'>{this.props.tvalue}</span>
				</Card.Body>  
    
			</Card>
		);
	}
}
