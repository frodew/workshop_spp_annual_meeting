# Quick Deployment Guide for GitHub Pages

## Quick Start (3 Steps)

### 1. Create GitHub Repository
Go to GitHub and create a new repository named `workshop_spp_annual_meeting`

### 2. Push Your Code
```bash
cd /Users/frod/Code/spp/workshop_spp_annual_meeting

# Initialize and push
git init
git add .
git commit -m "Initial commit: Workshop materials"
git remote add origin https://github.com/YOUR-USERNAME/workshop_spp_annual_meeting.git
git branch -M main
git push -u origin main
```

### 3. Enable GitHub Pages
1. Go to repository Settings → Pages
2. Under "Build and deployment":
   - Source: "Deploy from a branch"
   - Branch: `main` → `/docs` folder
3. Click Save

Your site will be live at: `https://YOUR-USERNAME.github.io/workshop_spp_annual_meeting/`

## What's Been Created

✅ **Workshop folder** with all necessary files:
- `index.qmd` - Landing page with workshop info
- `01-intro.qmd` - Session 1: Welcome & Intro to Digital Traces
- `02-study-participant-perspective.qmd` - Session 2: Participant Perspective
- `03-study-researcher-perspective.qmd` - Session 3: Researcher Perspective
- `04-bias-outro.qmd` - Session 4: Bias & Outro

✅ **Supporting files** copied:
- `images/` - All images from original workshop
- `data/` - Data files for exercises
- `references/` - Bibliography files

✅ **Configuration files** created:
- `_quarto.yml` - Website configuration
- `.gitignore` - Git ignore file
- `.nojekyll` - Prevents Jekyll processing on GitHub Pages
- `README.md` - Full documentation
- `DEPLOYMENT_GUIDE.md` - This file

✅ **Template applied**:
- All QMD files use the `unima-quarto-revealjs` theme
- Consistent formatting across all presentations

✅ **Website rendered**:
- `docs/` folder contains the generated HTML files
- Ready to be hosted on GitHub Pages

## Making Updates

After making changes to any `.qmd` file:

```bash
# Re-render the website
quarto render

# Commit and push
git add .
git commit -m "Update workshop materials"
git push
```

GitHub Pages will automatically update within a few minutes.

## Customization Tips

### Update Workshop Details
Edit `index.qmd` to update:
- Date and location
- Timetable
- Contact information

### Modify Presentations
Edit individual `.qmd` files (01-04) for content changes

### Change Theme Colors
The presentations use the University of Mannheim theme. To customize, you would need to modify the theme extension in `_extensions/FriederRodewald/unima-quarto/`

### Update GitHub Link
After creating your repository, update `_quarto.yml`:
```yaml
website:
  navbar:
    tools:
      - icon: github
        href: https://github.com/YOUR-USERNAME/workshop_spp_annual_meeting
```

## Troubleshooting

**Website not updating?**
- Verify you pushed to the `main` branch
- Check that `/docs` folder is selected in GitHub Pages settings
- Wait 2-3 minutes for build to complete

**Images not showing?**
- Images are stored in `images/` folder
- They should render correctly if you've committed them

**Presentations look different?**
- Font warnings during render are normal (system fonts will be used as fallback)
- The UniMa theme requires specific fonts that may not be on all systems

## Alternative: Quarto Publish Command

Instead of manual GitHub setup, use:
```bash
quarto publish gh-pages
```

This automatically handles everything for you!

## Next Steps

1. Push to GitHub (see Quick Start above)
2. Enable GitHub Pages
3. Share your workshop URL!
4. Update content as needed for your specific workshop date/location
