<template>
    <div class="container">
        <div class="columns">
            <div class="column is-one-fifth">
                <aside class="menu">
                    <p class="menu-label is-size-6">
                        <strong>Student</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="sAttendanceX"><a>Attendance</a></li>
                        <li @click="reportsX"><a>Reports</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Faculty</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="fAttendanceX"><a>Attendance</a></li>
                        <li @click="marksX"><a>Marks</a></li>
                        <li @click="faX"><a>FA Warning</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Time Table</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="tsX"><a>View Today's Schedule</a></li>
                        <li @click="ttX"><a>My Timetable</a></li>
                        <li @click="cttX"><a>My Class Timetable</a></li>
                    </ul>
                </aside>
            </div>
            
            <div class="column" id="dash">

                <template v-if="sAttendance">
                    Student Attendance
                </template>

                <template v-else-if="reports">
                    Reports
                </template>

                <template v-else-if="fAttendance">
                    Faculty Attendance
                </template>

                <template v-else-if="marks">
                    Marks
                </template>

                <template v-else-if="fa">
                    FA List
                </template>

                <template v-else-if="ts">
                    Today's Schedule
                </template>

                <template v-else-if="tt">
                    My Timetable
                </template>

                <template v-else-if="ctt">
                    My Class Timetable
                </template>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
//   * {
//     transition: all 0.3s ease-in-out;
//     background: var(--primary);
//     color: var(--light);
//   }

//   .is-fullwidth {
//     width: 100%;
//   }

//   #profile,
//   .is-center {
//     min-height: 100vh;
//     align-items: center;
//     justify-content: center;
//   }

//   .media-content {
//     max-width: 90vw;

//     h1 {
//       text-overflow: clip;
//       color: var(--font2);
//     }
//   }

//   .content {
//     padding-top: 2.5rem;
//   }

//   .pad {
//     padding: 1rem;
//   }

//   .box {
//     background: var(--tertiary);

//   }

//   .is-underlined {
//     text-decoration: underline;
//   }

</style>

<script>
    import firebase from '~/plugins/firebase'
    import db from '~/plugins/firebase'

    export default {
        data() {
            return {
                email: '',
                userData: {
                    name: '',
                    gender: '',
                    email: '',
                    phone_number: '',
                    display: '',
                },
                sAttendance: true,
                reports: '',
                fAttendance: '',
                marks: '',
                fa: '',
                ts: '',
                tt: '',
                ctt: ''            
            }
        },
        

        layout: 'nav',

        methods: {
            sAttendanceX() {
                this.sAttendance = true
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            reportsX() {
                this.sAttendance = false
                this.reports = true
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            fAttendanceX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = true
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            marksX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = true
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            faX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = true
                this.ts = false
                this.tt = false
                this.ctt = false
            },
            tsX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = true
                this.tt = false
                this.ctt = false
            },
            ttX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = true
                this.ctt = false
            },
            cttX() {
                this.sAttendance = false
                this.reports = false
                this.fAttendance = false
                this.marks = false
                this.fa = false
                this.ts = false
                this.tt = false
                this.ctt = true
            }
        },

        created() {
            let user = firebase.auth().currentUser
            // db.collection('profile').doc(user.uid)
        }
    }
</script>