import React from 'react';
import './Gamepad.css';
import { Button, Row, Col } from 'react-bootstrap';
import {ipcRenderer} from 'electron';
import { CALIBRATE_CALL, CALIBRATE_RECEIVE , STORE_UPDATED} from '../../constants';

class Gamepad extends React.Component {
	constructor(props) {
		super(props);
		this.calibrateClick = this.calibrateClick.bind(this);
		this.state = {
			message: 'something',
			calibrating: false
		}

		ipcRenderer.on(CALIBRATE_RECEIVE, (event, args) => {
			this.setState({message: args});
			if(args == 'Calibration Started...') this.setState({calibrating: true});
		});

		ipcRenderer.on(STORE_UPDATED, (event, args) =>{
			let out = JSON.stringify(args);
			this.setState({message: out});
		})
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
