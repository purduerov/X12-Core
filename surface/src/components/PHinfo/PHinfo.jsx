import React, { Component } from 'react';
import styles from './PHinfo.css';
import {Card, Button, ListGroup} from 'react-bootstrap';
import '../../styles/Card.css';

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
            <Card className='card-custom'>
                <Card.Title>pH and Temperature</Card.Title>
                <Card.Body className='card-body'>
                    <ListGroup variant="flush" style={{backgroundColor:'#333333'}}>
                        <ListGroup.Item style={{backgroundColor:'#333333'}}>pH: {this.props.ph}</ListGroup.Item>
                        <ListGroup.Item style={{backgroundColor:'#333333'}}>Temperature: {this.props.temp}</ListGroup.Item>
                    </ListGroup>
                </Card.Body>
                <Button variant='primary' onClick={this.freeze}>Freeze/Unfreeze Display</Button>     
            </Card>
        );
    }
}
