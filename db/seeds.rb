# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
beginner = 'beginner'
intermediate = 'intermediate'
advanced = 'advanced'

strength = 'strength'
cardio = 'cardio'
flexibility = 'flexibility'
str_cardio = 'str_cardio'
str_flex = 'str_flex'

exercises = [
    {name: 'Barbell Bench Press', difficulty: beginner, duration: , instructions: 'Setup. Lie on the flat bench with your eyes under the bar. Grab the bar. Put your pinky on the ring marks of your bar. Unrack. Take a big breath and unrack the bar by straightening your arms. Lower the bar. Lower it to your mid-chest while tucking your elbows 75°. Press.', type: strength, video_url: }, 
    {name: 'Incline Barbell Bench Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Dumbbell Bench Press', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Dumbbell Flye', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Decline Barbell Bench Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Incline Dumbbell Flye', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Decline Dumbbell Flye', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Standard Push-up', difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Military Push-up', difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Dive Bomber Push-up', difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Diamond Push-up', difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Wide Push-up', difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Dumbbell Squeeze Press', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Incline Dumbbell Bench Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Decline Dumbbell Bench Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Close-grip Barbell Bench Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Seated Machine Chest Press', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Drop Push-up', difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Chest Dip', difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Clap Push-up', difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Cable Crossover', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Seated Dumbbell Tricep Extension', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Pike Push-ups', difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Incline Push-up', difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Dumbbell Pullover', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Weighted Chest Dips', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Weighted Standard Push-up', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Smith Machine Bench Press', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Single-arm Cable Crossover', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Tricep Dips', difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Cable V-bar Pushdown', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Decline EZ-bar Skullcrusher', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Dumbbell Floor Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Weighted Tricep Dip', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'EZ-bar Skullcrusher', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Reverse Grip Triceps Pushdown', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Kneeling Cable Triceps Extension', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Single-arm Cable Triceps Extension', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Triceps Pushdown - Rope Attachment', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Incline EZ-bar Skullcrusher', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Tricep Dumbbell Kickback', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Palms-up Wrist Curl Over Bench', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'One-arm Overhead Dumbbell Extension', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Barbell Overhead Shoulder Press', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Lateral Dumbbell Flye", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Dumbbell Front Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Lateral Dumbbell Flye", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Dumbbell Front Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Rope Face Pull', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "High Pull", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Trapezius Raise", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Clean and Press", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Band Lateral Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Band Front Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Band Bent Over Lateral Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Band W Raise", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Hindu Push-up", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Plank", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Lateral Plank Walk", difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Dumbbell Neutral Grip Overhead Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Dumbbell Raise Complex', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Rack Deadlift', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Snatch-Grip Low Pull", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Snatch-Grip Shrug Pull", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Snatch-Grip High Pull', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Suspension Trainer Pike Push-ups', difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: 'Suspension Trainer Y-raise', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Suspension Trainer Rear-Deltoid Raise', difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Deadlift/Shrug Combination", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Farmer's Walk", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Dumbbell Bent Over Lateral Raise', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Machine Seated Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Bent Over Reverse Flye", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Military Press', difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Seated Barbell Shoulder Press', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Dumbbell Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Handstand Shoulder Press', difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Arnold Press", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Alternating Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Alternating Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Behind Neck Press", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "One-arm Dumbbell Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Smith Machine Shoulder Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Smith Machine Behind Neck Press", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Barbell Upright Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Upright Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Cable Upright Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing One-arm Lateral Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated One-arm Lateral Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Incline Bench Lateral Raise", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing One-arm Front Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated One-arm Front Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Smith Machine Upright Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Rear Deltoid Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Machine Rear Deltoid Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Lying Rear Deltoid Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Rear Lateral Raise", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "T-bar Rear Deltoid Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Smith Machine Rear Deltoid Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Stair Push-ups", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Standing Barbell Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Concentration Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: 'EZ-bar Preacher Curl', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Preacher Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Machine Preacher Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Resistance Band Hammer Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Hammer Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Dumbbell Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Alternating Dumbbell Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Dumbbell Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Alternating Dumbbell Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Spider Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Underhand-grip Inverted Row", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Decline Dumbbell Curl", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Incline Dumbbell Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Incline Alternating Dumbbell Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: 'Bent Over Barbell Row', difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Kneeling Single-arm Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Towel Hammer Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Zottman Curl", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Cable Rope Hammer Curl", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Cable Alternating Flex Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Lying Preacher Curls", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Seated Cable Row", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Pull-up", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Assisted Pull-up", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Reverse-grip Pull-up", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Assisted Reverse-grip Pull-up", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Wide-grip Pull-up", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Assisted Wide-grip Pull-up", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Deadlift", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Weighted Pull-up", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Romanian Deadlift", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Romanian Deadlift", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Pallof Press Iso Hold", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Incline Dumbbell Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Trap-bar Deadlift", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Bent Over Alternating Dumbbell Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Swiss Ball Leg Curl", difficulty: beginner, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Landmine One-arm Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Towel Cable Row", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Rotational Inverted Row", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Burpee", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Pike-Up to Superman", difficulty: advanced, duration: , instructions: , type: str_cardio video_url: }, 
    {name: "Hang Clean", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Back Extension", difficulty: beginner, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Aquaman", difficulty: beginner, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Superman", difficulty: beginner, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Suspension Trainer Pull-up", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Barbell Squat", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Suspension Trainer Inverted Row", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Swiss Ball Reverse Back Extension", difficulty: beginner, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Yates Row", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Bent Over Row to Neck", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Front Squat", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Bulgarian Split Squat", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Stepup", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Single-leg Romanian Deadlift", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Leg Press", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Bodyweight Calf Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Walking Lunge", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Pause Squat", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Reverse Lunge", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Dumbbell Squat", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Kettlebell Swing", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Jump Squat", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Barbell Calf Raise", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Dumbbell Calf Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Kneeling Hip Flexor Stretch", difficulty: beginner, duration: , instructions: , type: flexibility, video_url: }, 
    {name: "Skater Squat", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Jumping Calf Raise", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Barbell Hip Thrust", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Smith Machine Hip Thrust", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Glute Bridge Walkout", difficulty: intermediate, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Single-leg Glute Bridge", difficulty: advanced, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Seated Machine Calf Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Standing Machine Calf Raise", difficulty: beginner, duration: , instructions: , type: strength, video_url: }, 
    {name: "Swiss Ball Wall Squat", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Reverse Table-up", difficulty: intermediate, duration: , instructions: , type: str_flex, video_url: }, 
    {name: "Kettlebell Press-out", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Suspension Trainer Leg Curl", difficulty: intermediate, duration: , instructions: , type: strength, video_url: }, 
    {name: "Overhead Barbell Lunge", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Walking Barbell Lunge", difficulty: advanced, duration: , instructions: , type: strength, video_url: }, 
    {name: "Inchworm", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Power Skip", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Uppercut", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Mountain Climber", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Mountain Climber Twist", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "High Knees", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Jabs", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Plank Jack", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Butt Kick", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Fast Feet Shuffle", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Plank-to-knee Tap", difficulty: beginner, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Jumping Jack", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Vertical Jump", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Skaters", difficulty: beginner, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Long Jump with Jog Back", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Tuck Jump", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Corkscrew", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Wide Mountain Climber", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Invisible Jump Rope", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Hop to Push-up", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Single-leg Hop", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Runner's Skip", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Flutter Kick", difficulty: intermediate, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Sprinter Situp", difficulty: intermediate, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Squat Jump", difficulty: advanced, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Tricep Push-up with Mountain Climber", difficulty: advanced, duration: , instructions: , type: str_cardio, video_url: }, 
    {name: "Box Jump", difficulty: advanced, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Donkey Kick", difficulty: advanced, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Lateral Jump", difficulty: advanced, duration: , instructions: , type: cardio, video_url: }, 
    {name: "Jumping Lunge", difficulty: advanced, duration: , instructions: , type: cardio, video_url: }
]