import React, { Component } from 'react';
import {Card, Button, ListGroup} from 'react-bootstrap';
import '../../styles/Card.css'; //Overriding base card CSS
import '../../styles/ListGroup.css'; //Same as above but for ListGroup

/*

This should be the standard styling for any component going into the ControlColumn
Required parts are:
Card
--Card.Body

The rest are examples of bootstrap integration for info display

*/

export default class ExampleComponent extends Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <Card className="card-custom">
                <Card.Title>Optional Title</Card.Title>
                <Card.Body className='card-body-custom'>
                    Body is necessary for padding mostly
                    <ListGroup variant="flush" className='listgroup-custom'>
                        <ListGroup.Item className="listgroup-item-custom">
                            Example:<span className='text-right'>text</span>
                        </ListGroup.Item>
                        <ListGroup.Item className="listgroup-item-custom">
                            List:<span className='text-right'>on</span>
                        </ListGroup.Item>
                        <ListGroup.Item className="listgroup-item-custom">
                            With:<span className='text-right'>the</span>
                        </ListGroup.Item>
                        <ListGroup.Item className="listgroup-item-custom">
                            Spacing:<span className='text-right'>ride</span>
                        </ListGroup.Item>
                    </ListGroup>
                </Card.Body>
                <Button variant='secondary' onClick={this.freeze}>A button I guess</Button>     
            </Card>
        );
    }
}
