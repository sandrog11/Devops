import { LightningElement } from 'lwc';

export default class EnrollAllCourse extends LightningElement {
    allCourseDetailInfo = [
        {courseName:'Lightning Web Component', courseDuration: '20 days', courseFee : '$200', courseRating: '****'},
        {courseName:'Aura Component', courseDuration: '15 days', courseFee : '$100', courseRating: '****'},
        {courseName:'Java', courseDuration: '20 days', courseFee : '$200', courseRating: '*****'},
        {courseName:'C#', courseDuration: '20 days', courseFee : '$200', courseRating: '****'}
    ];
}