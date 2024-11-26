# Blog Application README

## Overview

This README outlines the steps I took to build my blog application, the challenges I encountered, and the current state of the project. It also includes reflections on lessons learned and areas for improvement.

---

## Features Implemented

1. **Models and Associations**  
   - **Authors**: Added the ability to create and manage authors.  
   - **Categories**: Implemented categories to organize articles.  
   - **Articles**: Articles belong to categories and authors.  
   - **Comments**: Added comments functionality to articles for user interaction.  

   Each model was successfully integrated into the application with full CRUD functionality.

2. **Routing**  
   - Initially, I used **nested resources** for all models, which caused unnecessary complexity. This approach led to many issues, such as route conflicts and overly verbose URL paths.
   - After several rollbacks and discussions with my partner, I switched to **flat routes**, which greatly simplified the application’s structure.

3. **Stripe Integration for Donations**  
   - Integrated Stripe to accept donations using test keys.  
   - Configured Stripe API keys securely using Rails encrypted credentials.  

4. **User Interface and Styling**  
   - Added basic styling to make the app more user-friendly.  
     

5. **CRUD Functionality for Stretch Goal**  
   - Tried adding images to categories but reverted this due to challenges with image deletion.  

---

## Challenges Faced

### 1. **Route Complexity**
   - **Problem**: Nested resources initially made the application overly complicated, especially for categories and comments.  
   - **Solution**: Flattened routes with the help of my partner, which simplified controllers and views.  

### 2. **Database Rollbacks**
   - **Problem**: I accidentally recreated several schemas while iterating on models, leading to a cluttered database.  
   - **Solution**: Performed rollbacks and ensured proper migrations going forward. I also learned to double-check schema changes before committing.

### 3. **Stripe Donation Issues**
   - **Problem**: When clicking the "Donate" button, the browser indicated that I was in live mode despite setting the keys and Stripe dashboard to test mode.  
   - **Solution**: While I ensured test keys were properly configured in `config/credentials.yml.enc` and Stripe was switched to test mode, the issue persists. This will require further debugging.

### 4. **Styling Challenges**
   - **Problem**: Some methods began acting unexpectedly after implementing custom CSS, which may have been due to conflicting class names or styles.  
   - **Solution**: I removed some styling temporarily and realized I should rely more on prebuilt CSS frameworks like Bootstrap for efficiency.

### 5. **Image Management**
   - **Problem**: Attempted a stretch goal of adding images to categories but struggled to implement deletion functionality for images.  
   - **Solution**: Undid the feature and plan to revisit this once I have a better understanding of file management in Rails.

---

## Current Limitations

1. **Donations**
   - The "Donate" button does not function as expected due to the live mode/test mode mismatch in Stripe.  

2. **Styling**
   - The application has basic styling but lacks a polished design. I need to explore CSS frameworks and prebuilt components further.

3. **Image Management**
   - Image upload and deletion for categories is not yet implemented.

---

## Lessons Learned

1. **Time Management**
   - Breaking tasks into smaller milestones and focusing on one feature at a time significantly improves productivity.  

2. **Frequent Git Commits**
   - Regularly pushing code after implementing CRUD for each model helps avoid losing progress and makes debugging easier.

3. **Simplifying Complexity**
   - Avoid overengineering. For example, flat routes are often better than deeply nested ones in many cases.

4. **Leveraging Resources**
   - I’ve realized there are many tools and libraries (e.g., CSS frameworks, image management gems) that can save time and effort. I need to incorporate these more into my workflow.

---

## Next Steps

1. Debug the Stripe donation issue to ensure test mode functions as expected.  
2. Research and implement a reliable method for managing image uploads and deletions.  
3. Focus on improving the app's design by leveraging prebuilt CSS frameworks and templates.  
4. Allocate time for testing each feature to ensure all methods behave as expected, even after styling changes.

---

## Conclusion

Building this blog application has been a valuable learning experience. While I faced several challenges, I’ve gained a deeper understanding of Rails, problem-solving, and time management. There’s still work to be done, but I’m proud of the progress so far and excited to refine the app further!