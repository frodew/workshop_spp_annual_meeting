# Data Donation Studies Workshop - SPP Annual Meeting

Workshop materials on data donation studies for collecting digital trace data.

**Workshop Leaders:**
- Frieder Rodewald (University of Mannheim)
- Valerie Hase (LMU Munich)

Part of the DFG project "Integrating Data Donations in Survey Infrastructure" ([project website](https://data-donation-science.de))

## Setup and Deployment

### Prerequisites
- [Quarto](https://quarto.org/docs/get-started/) installed
- Git installed
- GitHub account

### Building the Website Locally

1. Clone this repository:
```bash
git clone https://github.com/[YOUR-USERNAME]/workshop_spp_annual_meeting.git
cd workshop_spp_annual_meeting
```

2. Render the website:
```bash
quarto render
```

3. Preview locally:
```bash
quarto preview
```

### Deploying to GitHub Pages

#### Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and create a new repository named `workshop_spp_annual_meeting`
2. **Do not** initialize with README, .gitignore, or license (we already have these)

#### Step 2: Push to GitHub

From your local `workshop_spp_annual_meeting` directory:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Workshop materials"

# Add remote (replace YOUR-USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR-USERNAME/workshop_spp_annual_meeting.git

# Push to GitHub
git branch -M main
git push -u origin main
```

#### Step 3: Configure GitHub Pages

1. Go to your repository on GitHub: `https://github.com/YOUR-USERNAME/workshop_spp_annual_meeting`
2. Click on **Settings** (top right)
3. In the left sidebar, click **Pages**
4. Under "Build and deployment":
   - **Source**: Select "Deploy from a branch"
   - **Branch**: Select `main` and `/docs` folder
   - Click **Save**

5. Wait a few minutes for the site to build
6. Your site will be available at: `https://YOUR-USERNAME.github.io/workshop_spp_annual_meeting/`

#### Step 4: Update Links

After deployment, update the GitHub link in `_quarto.yml`:

```yaml
website:
  navbar:
    tools:
      - icon: github
        href: https://github.com/YOUR-USERNAME/workshop_spp_annual_meeting
```

Then re-render and push:

```bash
quarto render
git add .
git commit -m "Update GitHub links"
git push
```

### Alternative: Using Quarto Publish

You can also use Quarto's built-in publishing:

```bash
quarto publish gh-pages
```

This will automatically:
- Create a `gh-pages` branch
- Render your site
- Push to GitHub
- Configure GitHub Pages

## Project Structure

```
workshop_spp_annual_meeting/
├── _quarto.yml              # Quarto configuration
├── index.qmd                # Landing page
├── 01-intro.qmd            # Session 1 slides
├── 02-study-participant-perspective.qmd  # Session 2 slides
├── 03-study-researcher-perspective.qmd   # Session 3 slides
├── 04-bias-outro.qmd       # Session 4 slides
├── images/                  # Images folder
├── data/                    # Data files
├── references/             # Bibliography files
├── _extensions/            # Quarto theme extension (UniMa)
├── docs/                   # Generated website (output directory)
└── README.md               # This file
```

## Updating Content

1. Edit the `.qmd` files as needed
2. Render the site: `quarto render`
3. Commit and push changes:
```bash
git add .
git commit -m "Update workshop materials"
git push
```

GitHub Pages will automatically update within a few minutes.

## Customization

### Changing the Theme
Edit `_quarto.yml` to change the HTML theme:
```yaml
format:
  html:
    theme: [cosmo, flatly, lux, etc.]
```

### Adding Custom CSS
Create a `styles.css` file and reference it in `_quarto.yml`:
```yaml
format:
  html:
    css: styles.css
```

### Presentation Slides
The presentation slides use the `unima-quarto-revealjs` format (University of Mannheim theme). Each `.qmd` file contains one presentation session.

## Troubleshooting

### Site Not Updating
- Check that you've pushed to the correct branch (`main`)
- Verify the output directory is set to `docs` in `_quarto.yml`
- Check GitHub Actions for any build errors

### Images Not Loading
- Ensure image paths are relative (e.g., `images/photo.jpg`)
- Check that images were committed to the repository

### 404 Errors
- Make sure `.nojekyll` file is in the docs folder
- Check that the `docs` folder is not in `.gitignore`

## License

[Add your license information here]

## Contact

For questions about the workshop or materials:
- Frieder Rodewald: [frieder-rodewald.de](https://frieder-rodewald.de/)
- Valerie Hase: [valerie-hase.com](https://valerie-hase.com/)
