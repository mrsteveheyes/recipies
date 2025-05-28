# Recipies PRD

### TL;DR

Recipies is a web-based application designed to help families plan their
weekly dinners, manage a list of recipes, and automatically generate
consolidated shopping lists. Targeted at family meal planners, Recipies
aims to streamline the process of deciding what’s for dinner and
shopping for only what is necessary, ensuring less food waste and more
efficient meal prep.

------------------------------------------------------------------------

## Goals

### Business Goals

- Validate market demand for digital meal planning and grocery list
  generation tools (target: 500 signups within 3 months).

- Enable a proof-of-concept with high engagement (target: 50% weekly
  active user rate).

- Lay technical foundations for future feature expansion (e.g., advanced
  recipe integrations, ingredient tracking).

- Collect actionable user feedback to inform next product iterations.

- Optimize development costs and speed to keep MVP scope lean.

### User Goals

- Easily plan dinners for each night of the week in advance.

- Quickly add, save, and access favorite recipes.

- Generate a comprehensive, de-duplicated shopping list from planned
  meals.

- Seamlessly review the day’s meal plan ("What’s for dinner tonight?").

- Access entire solution from both web and mobile for convenience.

### Non-Goals

- Support for breakfast or lunch planning (dinner only for MVP).

- Advanced nutritional analysis, meal suggestions, or automated recipe
  recommendations.

- Integration with grocery delivery services or in-app purchasing at
  this stage.

------------------------------------------------------------------------

## User Stories

### Primary Persona: Family Meal Planner (typically a parent)

- As a family meal planner, I want to add planned dinners for each day
  of the week so that I know what to cook each night.

- As a meal planner, I want to quickly create and save recipes (at
  minimum: name and link), so that I can reuse my favorites.

- As a user, I want to generate a single shopping list containing all
  the needed ingredients for planned meals so I can shop efficiently.

- As a user, I want to check what’s for dinner today with one tap, so I
  can prepare ahead.

- As a user, I want a simple, mobile-friendly experience so I can plan
  or check my plan anywhere (in the kitchen, on the go, at the store).

------------------------------------------------------------------------

## Functional Requirements

- **Meal Calendar (Priority: High)**

  - Allow user to select and assign a dinner recipe to each day of the
    upcoming week.

  - Visual calendar/grid display of the weekly plan.

- **Recipe Management (Priority: High)**

  - Add new recipes (name + external link for MVP).

  - List/view basic recipe details.

  - Edit/delete recipes.

- **Today View (Priority: High)**

  - Show at-a-glance info for "today’s" planned meal.

  - Quick link to corresponding recipe instructions.

- **User Account Management (Priority: Medium)**

  - Basic login and persistent user data.

- **Shopping List Generation (Priority: Medium)**

  - Combine ingredients from all planned meals for the week.

  - De-duplicate overlapping ingredients.

  - Present a clean checklist grouping by grocery section (if ingredient
    types available).

------------------------------------------------------------------------

## User Experience

**Entry Point & First-Time User Experience**

- Access via simple signup/login (email/social).

- Onboarding screens (brief: explain meal calendar and shopping list).

- Prompt to add first few recipes (minimum fields to reduce friction).

**Core Experience**

- **Step 1:** Land on weekly meal planner dashboard.

  - Overview of this week’s calendar with option to add/edit dinners.

  - Highlighted “today” tile.

- **Step 2:** Add or select a recipe for any day.

  - Quick search or add-new.

  - Minimal required fields: recipe name, link (ingredients optional on
    MVP).

  - Visual confirmation of assignment to calendar.

- **Step 3:** View and manage recipe library.

  - See all added recipes, with ability to edit or delete.

- **Step 4:** Generate shopping list for the week.

  - Button generates consolidated list immediately.

  - Display as interactive checklist for store use.

  - Clearly group/check off items (future: categorize by aisle).

- **Step 5:** "Today" quick-view page (/today).

  - Shows tonight's meal, recipe link.

  - Option to jump back to weekly planner.

**Advanced Features & Edge Cases**

- "No plan for day" edge case: prompt user to assign a dinner.

- Duplicate recipe handling: error or confirmation modal.

- Mobile offline access (future consideration).

- Smooth responsive design on both web and mobile browsers.

**UI/UX Highlights**

- Touch-friendly controls and responsive layout for phones, tablets, and
  desktops.

- High-contrast text and accessible color scheme (WCAG AA minimum).

- Fast, minimal navigation: all core actions within 1–2 taps/clicks.

- Simple, reassuring error states (e.g., “Couldn’t save recipe, please
  try again.”)

- Focus on clarity over aesthetics for MVP.

------------------------------------------------------------------------

## Narrative

Maria is a busy parent managing dinners for her family of four. On
Sunday night, she sits down with her phone and opens Recipies. After a
quick signup, the app greets her with a simple onboarding: she learns
she can plan all her meals for the week and instantly create a shopping
list.

Maria starts by adding a handful of favorite recipes—just a title and a
link to a trusted food site. She drags her “Taco Night” to Tuesday, adds
the lasagna recipe for Friday, and quickly fills the rest of the week.
With a single tap, she’s presented with a shopping list for every
ingredient she’ll need, perfectly consolidated to avoid duplicates. The
next day at the supermarket, Maria loads the shopping list on her
phone—checking items off as she goes, only buying what she needs.

Every evening, Maria checks the /today view for a reminder: what’s for
dinner, and where to find the instructions. The whole week, family
mealtime is easier and less stressful—she enjoys less daily decision
fatigue and zero wasted food. For Recipies, the high engagement and
positive feedback validate the product’s approach, providing strong
insight on what to build next.

------------------------------------------------------------------------

## Success Metrics

### User-Centric Metrics

- Percentage of users who set up 3+ meals in a single week

- Weekly active user rate (WAU)

- Number of shopping lists generated per user per week

- Net Promoter Score (NPS) or basic user satisfaction survey

### Business Metrics

- Number of signups and activation rate (first week retention)

- Cost per activation (if acquiring users via ads)

- Conversion rate from trial to active use (if monetization tested)

### Technical Metrics

- Average page load time (\<2 seconds target)

- Bug and crash rate (critical issues \<1% sessions)

- Successful account creation and recipe save rate (\>95%)

### Tracking Plan

- User registration

- Meal plan creation per week

- Recipe addition/edit/deletion events

- Shopping list generator usage

- Page visits: /planner, /recipes, /list, /today

- User device/type breakdown

------------------------------------------------------------------------

## Technical Considerations

### Technical Needs

- Responsive web frontend using a Rails application supporting mobile
  and desktop browsers

- Lightweight backend for data storage and basic authentication
  (cloud-based database; REST API)

- Recipe schema: minimal (name, external link, future: ingredient list)

### Integration Points

- Optional: Social login for account creation (Google, Facebook)

- No initial integrations with grocery APIs or delivery services

### Data Storage & Privacy

- Store users’ planned calendar, recipes, and settings securely

- Comply with basic privacy standards (email/password hashed, no
  sensitive personal info at MVP)

- Clear data deletion/export policy

### Scalability & Performance

- MVP designed for low-to-moderate traffic (hundreds to thousands of
  users)

- Simple, stateless backend to allow horizontal scaling if necessary

### Potential Challenges

- Ensuring seamless UX across device types (mobile-first design)

- Handling future expansion to richer recipe formats (ingredients,
  instructions)

- Data entry friction: minimize to maximize initial engagement

------------------------------------------------------------------------
