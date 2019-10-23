import React from 'react';
import { Col, Row, Container } from 'react-bootstrap';

class Camera extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			cameras: [
				{
					url: 'url1'
				},
				{
					url: 'url2'
				},
				{
					url: 'url3'
				},
				{
					url: 'url4'
				},
				{
					url: 'url5'
				}
			]
		};
	}

	render() {
		return (
			<Container>
				<Row style={{height: '80%'}}>
					<iframe src="http://192.168.1.3:8090/test.mjpg" frameBorder="0" height="100%" width="100%"></iframe>
				</Row>
				<Row style={{height: '20%'}}>
					<Col>
						<iframe src="http://192.168.1.3:8090/test2.mjpg" frameBorder="0" height="100%" width="100%"></iframe>
					</Col>
					<Col>
						Feed 3
					</Col>
					
					<Col>
						Feed 4
					</Col>
					<Col>
						Feed 5
					</Col>
				</Row>
			</Container>
		);
	}
}

//ffserver

export default Camera;
