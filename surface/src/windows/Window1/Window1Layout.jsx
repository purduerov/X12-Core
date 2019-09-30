import 'bootstrap/dist/css/bootstrap.min.css';
import React, { Component } from 'react';
import Titlebar from '../../components/Titlebar/Titlebar.jsx';
import ControlColumn from '../../components/ControlColumn/ControlColumn.jsx';
import {Row, Col, Container, Button} from 'react-bootstrap';
import Camera from '../../components/Camera/Camera.jsx';
import Gamepad from '../../components/Gamepad/Gamepad.jsx';

export default class Window1Layout extends Component {
	constructor(props){
		super(props);
		
	}

	render() {
		return (
			<Container fluid style={{padding: '0'}}>
				<Titlebar title='Purdue ROV Primary Screen' />
				<Row noGutters='true' style={{height: '94%'}}>
					<Col style={{padding: '.5rem'}}>
						<ControlColumn/>
					</Col>
					<Col xs={6}>
						<Row noGutters='true' style={{height: '70%', padding: '.5rem'}}>
							<Col>
								<ControlColumn>
									<Camera></Camera>
								</ControlColumn>
							</Col>
						</Row>
						<Row noGutters='true' style={{height: '30%'}}>
							<Col style={{padding: '.5rem'}}>
								<ControlColumn>
									<Gamepad></Gamepad>
								</ControlColumn>
							</Col>
							<Col style={{padding: '.5rem'}}>
								<ControlColumn/>
							</Col>
						</Row>
					</Col>
					<Col style={{padding: '.5rem'}}>
						<ControlColumn/>
					</Col>
				</Row>
			</Container>
		);
	}
}
