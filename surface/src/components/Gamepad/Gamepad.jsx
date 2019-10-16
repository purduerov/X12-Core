import React from 'react';
import './Gamepad.css';
import { Button, Row, Col } from 'react-bootstrap';
import {ipcRenderer, ipcMain} from 'electron';

const CALIBRATE_CALL = 'calibrate-gamepad';
const CALIBRATE_RECEIVE = 'calibrate-receive';

class Gamepad extends React.Component {
	constructor(props) {
		super(props);
		this.state = require('../../gamepad/layout.json');
		this.calibrateClick = this.calibrateClick.bind(this);
		this.state.message = 'Hello';

		ipcRenderer.on(CALIBRATE_RECEIVE, (event, args) => {
			this.setState({message: args});
		});
	}

	calibrateClick(){
		ipcRenderer.send(CALIBRATE_CALL);
	}

	

	render() {
		return (
			<Col>
				<Row style={{height: '10%'}}>
					<Button onClick={this.calibrateClick}>Calibrate</Button>
				</Row>
				<Row style={{height: '90%', paddingTop: '1rem'}}>
					{this.state.message}
				</Row>
			</Col>
		);
	}
}

export default Gamepad;
