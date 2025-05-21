import { LightningElement, api } from 'lwc';

export default class EnrollCourse extends LightningElement {
    @api courseDetailInfo = {courseName:'Lightning Web Component', courseDuration: '20 days', courseFee : '$200', courseRating: '*****'};
}