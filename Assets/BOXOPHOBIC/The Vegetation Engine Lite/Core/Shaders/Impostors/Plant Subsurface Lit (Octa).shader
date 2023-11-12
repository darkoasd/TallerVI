// Made with Amplify Shader Editor v1.9.2.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Vegetation Engine Lite/Impostors/Plant Subsurface Lit (Octa)"
{
    Properties
    {
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[StyledCategory(Impostor Settings, 5, 10)]_ImpostorCat("[ Impostor Cat ]", Float) = 0
		_Albedo("Impostor Albedo & Alpha", 2D) = "white" {}
		_Normals("Impostor Normal & Depth", 2D) = "white" {}
		[NoScaleOffset]_Mask("Impostor Baked Masks", 2D) = "white" {}
		[NoScaleOffset]_Emissive("Impostor Emissive Map", 2D) = "white" {}
		_AI_Parallax("Impostor Parallax", Range( 0 , 1)) = 1
		_AI_ShadowView("Impostor Shadow View", Range( 0 , 1)) = 1
		_AI_ShadowBias("Impostor Shadow Bias", Range( 0 , 2)) = 0.25
		_AI_TextureBias("Impostor Texture Bias", Float) = -1
		[HideInInspector]_AI_DepthSize("Impostor Depth Size", Float) = 0
		[HideInInspector]_AI_SizeOffset("Impostor Size Offset", Vector) = (0,0,0,0)
		[HideInInspector]_AI_Frames("Impostor Frames", Float) = 0
		[HideInInspector]_AI_Offset("Impostor Offset", Vector) = (0,0,0,0)
		[HideInInspector]_AI_ImpostorSize("Impostor Size", Float) = 0
		[HideInInspector]_AI_FramesY("Impostor Frames Y", Float) = 0
		[HideInInspector]_AI_FramesX("Impostor Frames X", Float) = 0
		[Enum(Off,0,On,1)]_RenderSpecular("Impostor Render Specular", Float) = 1
		[Enum(Off,0,On,1)]_RenderCoverage("Impostor Alpha To Mask", Float) = 0
		_AI_Clip("Impostor Clip", Range( 0 , 1)) = 0.5
		[HideInInspector]_RenderQueue("Render Queue", Float) = 0
		[HideInInspector]_RenderPriority("Render Priority", Float) = 0
		[HDR][Space(10)]_ImpostorColor("Impostor Color", Color) = (1,1,1,1)
		_ImpostorSmoothnessValue("Impostor Smoothness", Range( 0 , 1)) = 1
		[StyledCategory(Global Settings)]_CategoryGlobal("[ Category Global ]", Float) = 1
		[StyledSpace(10)]_SpaceGlobalLayers("# Space Global Layers", Float) = 0
		_GlobalOverlay("Global Overlay", Range( 0 , 1)) = 1
		[StyledSpace(10)]_SpaceGlobalLocals("# Space Global Locals", Float) = 0
		_OverlayVariationValue("Overlay Variation", Range( 0 , 1)) = 0.5
		_OverlayProjectionValue("Overlay Projection", Range( 0 , 1)) = 0.5
		[StyledSpace(10)]_SpaceGlobalOptions("# Space Global Options", Float) = 0
		[StyledCategory(Occlusion Settings)]_CategoryOcclusion("[ Category Occlusion ]", Float) = 1
		[StyledMessage(Info, Use the Occlusion Color for tinting and the Occlusion Alpha as Global Color and Global Overlay mask multiplier when available., 0, 10)]_MessageOcclusion("# Message Occlusion", Float) = 0
		[HDR]_VertexOcclusionColor("Occlusion Color", Color) = (1,1,1,1)
		[StyledToggle]_VertexOcclusionOverlayMode("Use Inverted Mask for Overlay", Float) = 0
		[StyledCategory(Noise Settings)]_CategoryNoise("[ Category Noise ]", Float) = 1
		[StyledRemapSlider(_NoiseMinValue, _NoiseMaxValue, 0, 1)]_NoiseMaskRemap("Noise Mask Remap", Vector) = (0,0,0,0)
		[StyledCategory(Subsurface Settings)]_CategorySubsurface("[ Category Subsurface ]", Float) = 1
		[DiffusionProfile]_SubsurfaceDiffusion("Subsurface Diffusion", Float) = 0
		[HideInInspector]_SubsurfaceDiffusion_Asset("Subsurface Diffusion", Vector) = (0,0,0,0)
		[StyledSpace(10)]_SpaceSubsurface("# Space Subsurface", Float) = 0
		_SubsurfaceValue("Subsurface Intensity", Range( 0 , 1)) = 1
		[HDR]_SubsurfaceColor("Subsurface Color", Color) = (1,1,1,1)
		_SubsurfaceScatteringValue("Subsurface Power", Range( 0 , 16)) = 2
		_SubsurfaceAngleValue("Subsurface Angle", Range( 1 , 16)) = 8
		_SubsurfaceDirectValue("Subsurface Direct", Range( 0 , 1)) = 1
		_SubsurfaceNormalValue("Subsurface Normal", Range( 0 , 1)) = 0
		_SubsurfaceAmbientValue("Subsurface Ambient", Range( 0 , 1)) = 0.2
		_SubsurfaceShadowValue("Subsurface Shadow", Range( 0 , 1)) = 1
		_SubsurfaceMaskValue("Subsurface Use Mask", Range( 0 , 1)) = 1
		[StyledCategory(Emissive Settings)]_CategoryEmissive("[ Category Emissive ]", Float) = 1
		[Enum(Off,0,On,1)]_EmissiveMode("Emissive Mode", Float) = 0
		[HDR][Space(10)]_EmissiveColor("Emissive Color", Color) = (0,0,0,0)
		[Enum(Nits,0,EV100,1)]_EmissiveIntensityMode("Emissive Power", Float) = 0
		_EmissiveIntensityValue("Emissive Power", Float) = 1
		_EmissivePhaseValue("Emissive Phase", Range( 0 , 1)) = 1
		[HideInInspector]_emissive_intensity_value("_emissive_intensity_value", Float) = 1
		[StyledCategory(Fade Settings)]_CategorySizeFade("[ Category Size Fade ]", Float) = 1
		[StyledCategory(Motion Settings)]_CategoryMotion("[ Category Motion ]", Float) = 1
		[StyledSpace(10)]_SpaceMotionGlobals("# SpaceMotionGlobals", Float) = 0
		_MotionAmplitude_10("Motion Bending", Range( 0 , 2)) = 0.2
		_MotionPosition_10("Motion Rigidity", Range( 0 , 1)) = 0.5
		[IntRange]_MotionSpeed_10("Motion Speed", Range( 0 , 40)) = 2
		_MotionScale_10("Motion Scale", Range( 0 , 20)) = 1
		[HideInInspector]_VertexPivotMode("Enable Pre Baked Pivots", Float) = 0
		[HideInInspector]_VegetationMode("Legacy Vegetation Mode", Float) = 1
		[HideInInspector]_IsImpostorShader("_IsImpostorShader", Float) = 1
		[HideInInspector]_render_specular("_render_specular", Float) = 1
		[HideInInspector]_AI_Offset("_AI_Offset", Vector) = (0,0,0,0)
		[HideInInspector]_IsInitialized("_IsInitialized", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 1
		[HideInInspector]_IsIdentifier("_IsIdentifier", Float) = 0
		[HideInInspector]_IsCollected("_IsCollected", Float) = 0
		[HideInInspector]_IsCustomShader("_IsCustomShader", Float) = 0
		[HideInInspector]_IsShared("_IsShared", Float) = 0
		[HideInInspector]_HasEmissive("_HasEmissive", Float) = 0
		[HideInInspector]_HasGradient("_HasGradient", Float) = 0
		[HideInInspector]_HasOcclusion("_HasOcclusion", Float) = 0
		[HideInInspector]_VertexVariationMode("_VertexVariationMode", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 1210
		[HideInInspector]_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 1
		[HideInInspector]_IsPlantShader("_IsPlantShader", Float) = 1

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 1.0
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
    }

    SubShader
    {
		LOD 0

		
        Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" "ImpostorType"="Octahedron" }

		Cull Back
		AlphaToMask [_RenderCoverage]

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		struct SurfaceOutput
		{
			half3 Albedo;
			half3 Specular;
			half Metallic;
			float3 Normal;
			half3 Emission;
			half Smoothness;
			half Occlusion;
			half Alpha;
		};

		#define AI_RENDERPIPELINE
		ENDHLSL

		
        Pass
        {
			
			Name "Forward"
        	Tags { "LightMode"="UniversalForwardOnly" }

			Blend One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
            

        	HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_SRP_VERSION 140007
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fog

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			//#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS
			//#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			//#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			//#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			//#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			//#pragma multi_compile _ SHADOWS_SHADOWMASK
			//#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			//#pragma multi_compile _ LIGHTMAP_ON
			//#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			//#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#pragma shader_feature_local_fragment TVE_FEATURE_EMISSIVE
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


            struct VertexInput
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

        	struct VertexOutput
            {
                float4 clipPos                : SV_POSITION;
                float4 lightmapUVOrVertexSH	  : TEXCOORD0;
        		half4 fogFactorAndVertexLight : TEXCOORD1;
				float4 UVsFrame199 : TEXCOORD3;
				float4 UVsFrame299 : TEXCOORD4;
				float4 UVsFrame399 : TEXCOORD5;
				float4 octaframe99 : TEXCOORD6;
				float4 viewPos99 : TEXCOORD7;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            	UNITY_VERTEX_OUTPUT_STEREO
            };

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);
			half4 TVE_OverlayColor;
			half4 TVE_ExtrasParams;
			half TVE_SubsurfaceValue;
			half TVE_OverlaySubsurface;


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

            VertexOutput vert(VertexInput v)
        	{
        		VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID(v);
            	UNITY_TRANSFER_INSTANCE_ID(v, o);
        		UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				v.vertex.xyz += Final_VertexPosition890_g76506;

        		// Vertex shader outputs defined by graph
                float3 lwWNormal = TransformObjectToWorldNormal(v.normal );

                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);

         		// We either sample GI from lightmap or SH.
        	    // Lightmap UV and vertex SH coefficients use the same interpolator ("float2 lightmapUV" for lightmap or "half3 vertexSH" for SH)
                // see DECLARE_LIGHTMAP_OR_SH macro.
        	    // The following funcions initialize the correct variable with correct data
        	    OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
        	    OUTPUT_SH(lwWNormal, o.lightmapUVOrVertexSH.xyz);

        	    half3 vertexLight = VertexLighting(vertexInput.positionWS, lwWNormal);
        	    half fogFactor = ComputeFogFactor(vertexInput.positionCS.z);
        	    o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
        	    o.clipPos = vertexInput.positionCS;

        		return o;
        	}

        	half4 frag (VertexOutput IN
						, out float outDepth : SV_Depth
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						) : SV_Target			
			{
            	UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				SurfaceOutput o = (SurfaceOutput)0;

				//Calculated by AI
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				half3 Main_Albedo_Raw4295_g76506 = o.Albedo;
				half3 Main_Albedo3817_g76506 = ( Main_Albedo_Raw4295_g76506 * (_ImpostorColor).rgb );
				half3 Tint_Noise_Color5005_g76506 = float3(1,1,1);
				float4 break3589_g76506 = output0;
				half Main_Mask_Occlusion3712_g76506 = break3589_g76506.g;
				float3 lerpResult4779_g76506 = lerp( (_VertexOcclusionColor).rgb , float3( 1,1,1 ) , Main_Mask_Occlusion3712_g76506);
				half3 Occlusion_Color4789_g76506 = lerpResult4779_g76506;
				half3 Main_Albedo_Tinted4791_g76506 = ( Main_Albedo3817_g76506 * Tint_Noise_Color5005_g76506 * Occlusion_Color4789_g76506 );
				half3 Blend_Albedo_Colored3711_g76506 = Main_Albedo_Tinted4791_g76506;
				half3 Global_OverlayColor1758_g76506 = (TVE_OverlayColor).rgb;
				half4 Global_Extras_Params4559_g76506 = TVE_ExtrasParams;
				float4 break456_g76573 = Global_Extras_Params4559_g76506;
				half Global_Extras_Overlay156_g76506 = break456_g76573.z;
				half Main_Variation_Or_Metallic3607_g76506 = break3589_g76506.r;
				half Global_VariationMesh4531_g76506 = Main_Variation_Or_Metallic3607_g76506;
				float lerpResult3746_g76506 = lerp( 1.0 , Global_VariationMesh4531_g76506 , _OverlayVariationValue);
				half Overlay_Variation3739_g76506 = lerpResult3746_g76506;
				half Overlay_Value4803_g76506 = ( _GlobalOverlay * Global_Extras_Overlay156_g76506 * Overlay_Variation3739_g76506 );
				half3 World_Normal3638_g76506 = o.Normal;
				float lerpResult4683_g76506 = lerp( 1.0 , saturate( (World_Normal3638_g76506).y ) , _OverlayProjectionValue);
				half Overlay_Projection4636_g76506 = lerpResult4683_g76506;
				float3 temp_output_3_0_g76561 = ( Main_Albedo3817_g76506 * Tint_Noise_Color5005_g76506 );
				float dotResult20_g76561 = dot( temp_output_3_0_g76561 , float3(0.2126,0.7152,0.0722) );
				float clampResult4925_g76506 = clamp( saturate( ( dotResult20_g76561 * 5.0 ) ) , 0.2 , 1.0 );
				half Main_Albedo_Globals4847_g76506 = clampResult4925_g76506;
				half Overlay_Shading4874_g76506 = Main_Albedo_Globals4847_g76506;
				half Occlusion_Alpha4842_g76506 = _VertexOcclusionColor.a;
				float lerpResult5086_g76506 = lerp( Main_Mask_Occlusion3712_g76506 , ( 1.0 - Main_Mask_Occlusion3712_g76506 ) , _VertexOcclusionOverlayMode);
				float lerpResult5084_g76506 = lerp( Occlusion_Alpha4842_g76506 , 1.0 , lerpResult5086_g76506);
				half Occlusion_Overlay4860_g76506 = lerpResult5084_g76506;
				float temp_output_7_0_g76555 = 0.1;
				float temp_output_10_0_g76555 = ( 0.2 - temp_output_7_0_g76555 );
				half Overlay_Mask3762_g76506 = saturate( ( ( ( Overlay_Value4803_g76506 * Overlay_Projection4636_g76506 * Overlay_Shading4874_g76506 * Occlusion_Overlay4860_g76506 ) - temp_output_7_0_g76555 ) / ( temp_output_10_0_g76555 + 0.0001 ) ) );
				float3 lerpResult3875_g76506 = lerp( Blend_Albedo_Colored3711_g76506 , Global_OverlayColor1758_g76506 , Overlay_Mask3762_g76506);
				half3 Blend_Albedo_Overlay4100_g76506 = lerpResult3875_g76506;
				half3 Blend_Albedo_Wetness4830_g76506 = Blend_Albedo_Overlay4100_g76506;
				float3 _Vector12 = float3(1,1,1);
				half3 Tint_Highlight_Color4905_g76506 = _Vector12;
				float3 temp_output_4907_0_g76506 = ( Blend_Albedo_Wetness4830_g76506 * Tint_Highlight_Color4905_g76506 );
				half3 Blend_Albedo_Subsurface3874_g76506 = temp_output_4907_0_g76506;
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult3815_g76506 = lerp( float3( 1,0,0 ) , Blend_Albedo_Subsurface3874_g76506 , IsInitialized3811_g76506);
				
				float3 temp_cast_1 = (0.0).xxx;
				half3 Emissive_Color4947_g76506 = (_EmissiveColor).rgb;
				half3 Emissive_Texture4942_g76506 = (output1).rgb;
				half Emissive_Value4941_g76506 = ( ( 1.0 * _EmissivePhaseValue ) - 1.0 );
				half3 Emissive_Mask5026_g76506 = saturate( ( Emissive_Texture4942_g76506 + Emissive_Value4941_g76506 ) );
				float3 temp_output_3_0_g76572 = ( Emissive_Color4947_g76506 * Emissive_Mask5026_g76506 );
				float temp_output_15_0_g76572 = _emissive_intensity_value;
				float3 temp_output_23_0_g76572 = ( temp_output_3_0_g76572 * temp_output_15_0_g76572 );
				#ifdef TVE_FEATURE_EMISSIVE
				float3 staticSwitch5072_g76506 = temp_output_23_0_g76572;
				#else
				float3 staticSwitch5072_g76506 = temp_cast_1;
				#endif
				half3 Final_Emissive4365_g76506 = staticSwitch5072_g76506;
				
				float3 temp_cast_3 = (( 0.04 * _render_specular )).xxx;
				
				half Main_Mask_Smoothness3820_g76506 = break3589_g76506.a;
				half Main_Smoothness3838_g76506 = ( Main_Mask_Smoothness3820_g76506 * _ImpostorSmoothnessValue );
				half Blend_Smoothness_Wetness3898_g76506 = Main_Smoothness3838_g76506;
				
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				
				half3 Subsurface_Color3656_g76506 = ( (_SubsurfaceColor).rgb * Blend_Albedo_Wetness4830_g76506 );
				half Global_Subsurface4111_g76506 = TVE_SubsurfaceValue;
				half Global_OverlaySubsurface4959_g76506 = TVE_OverlaySubsurface;
				float lerpResult4960_g76506 = lerp( 1.0 , Global_OverlaySubsurface4959_g76506 , Overlay_Value4803_g76506);
				half Overlay_Subsurface4962_g76506 = lerpResult4960_g76506;
				half Subsurface_Intensity3684_g76506 = ( _SubsurfaceValue * Global_Subsurface4111_g76506 * Overlay_Subsurface4962_g76506 );
				half Main_Mask_Remap3609_g76506 = break3589_g76506.b;
				float lerpResult5069_g76506 = lerp( 1.0 , Main_Mask_Remap3609_g76506 , _SubsurfaceMaskValue);
				half Subsurface_Mask3666_g76506 = lerpResult5069_g76506;
				half3 Subsurface_Translucency3659_g76506 = ( Subsurface_Color3656_g76506 * Subsurface_Intensity3684_g76506 * Subsurface_Mask3666_g76506 * 10.0 );
				

				float3 Albedo = lerpResult3815_g76506;
				float3 Normal = World_Normal3638_g76506;
				float3 Emission = Final_Emissive4365_g76506;
				float3 Specular = temp_cast_3;
				float Metallic = 0;
				float Smoothness = Blend_Smoothness_Wetness3898_g76506;
				float Occlusion = 1;
				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;
				float3 Transmission = 1;
				float3 Translucency = Subsurface_Translucency3659_g76506;

				IN.clipPos.zw = clipPos.zw;

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				float3 WorldSpaceViewDirection = SafeNormalize( _WorldSpaceCameraPos.xyz - worldPos );

				InputData inputData = (InputData)0;
        		inputData.positionWS = worldPos;
				inputData.normalWS = Normal;
				inputData.viewDirectionWS = normalize(WorldSpaceViewDirection);

				#if defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord( worldPos );
				#endif

        	    inputData.fogCoord = IN.fogFactorAndVertexLight.x;
        	    inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = 1;

				#if defined(CUSTOM_BAKED_GI)
					half4 decodeInstructions = half4( LIGHTMAP_HDR_MULTIPLIER, LIGHTMAP_HDR_EXPONENT, 0.0h, 0.0h );
					inputData.bakedGI = UnpackLightmapRGBM( BakedGI, decodeInstructions ) * EMISSIVE_RGBM_SCALE;
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.lightmapUVOrVertexSH.xyz, inputData.normalWS);
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo = Albedo;
				surfaceData.metallic = Metallic;
				surfaceData.specular = Specular;
				surfaceData.smoothness = Smoothness,
				surfaceData.occlusion = Occlusion,
				surfaceData.emission = Emission,
				surfaceData.alpha = Alpha;
				surfaceData.normalTS = Normal;
				surfaceData.clearCoatMask = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR(inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += Albedo * transmission;

					SUM_LIGHT_TRANSMISSION(GetMainLight(inputData.shadowCoord));

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
						for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
						{
							FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION(light);
							}
						}
						#endif
						LIGHT_LOOP_BEGIN(pixelLightCount)
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION(light);
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += Albedo * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY(GetMainLight(inputData.shadowCoord));

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY(light);
								}
							}
						#endif
						LIGHT_LOOP_BEGIN(pixelLightCount)
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY(light);
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);

				outDepth = IN.clipPos.z;

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif

        		return color;
            }

        	ENDHLSL
        }

		
        Pass
        {
			
        	Name "ShadowCaster"
            Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

            HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_SRP_VERSION 140007
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_instancing

			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


            struct VertexInput
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

        	struct VertexOutput
        	{
        	    float4 clipPos : SV_POSITION;
                float4 UVsFrame199 : TEXCOORD7;
                float4 UVsFrame299 : TEXCOORD8;
                float4 UVsFrame399 : TEXCOORD9;
                float4 octaframe99 : TEXCOORD10;
                float4 viewPos99 : TEXCOORD11;
                UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
        	};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

            VertexOutput vert(VertexInput v)
        	{
        	    VertexOutput o;
        	    UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				v.vertex.xyz += Final_VertexPosition890_g76506;

        	    float3 positionWS = TransformObjectToWorld(v.vertex.xyz);
                float3 normalWS = TransformObjectToWorldDir(v.normal );

                //float invNdotL = 1.0 - saturate(dot(_LightDirection, normalWS));
                //float scale = invNdotL * _ShadowBias.y;

                // normal bias is negative since we want to apply an inset normal offset
				//positionWS = _LightDirection * _ShadowBias.xxx + positionWS;
				//positionWS = normalWS * scale.xxx + positionWS;

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
				float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
				float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
				clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
				clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				// no need for shadow bias alteration since we do it in fragment anyway
				o.clipPos = clipPos;

        	    return o;
        	}

            half4 frag(VertexOutput IN, out float outDepth : SV_Depth ) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				SurfaceOutput o = (SurfaceOutput)0;
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				

				IN.clipPos.zw = clipPos.zw;

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif
				outDepth = IN.clipPos.z;
                return 0;
            }

            ENDHLSL
        }

		
        Pass
        {
			
        	Name "DepthOnly"
            Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

            HLSLPROGRAM

            #define _SPECULAR_SETUP 1
            #pragma multi_compile _ LOD_FADE_CROSSFADE
            #define ASE_TRANSLUCENCY 1
            #pragma multi_compile _ DOTS_INSTANCING_ON
            #define ASE_SRP_VERSION 140007
            #ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
            #define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
            #else//AI_SRP
            #define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
            #endif//AI_SRP
            #define ASE_USING_SAMPLING_MACROS 1


            #pragma vertex vert
            #pragma fragment frag

			#pragma multi_compile_instancing

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


            struct VertexInput
            {
                float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

        	struct VertexOutput
        	{
        	    float4 clipPos      : SV_POSITION;
                float4 UVsFrame199 : TEXCOORD0;
                float4 UVsFrame299 : TEXCOORD1;
                float4 UVsFrame399 : TEXCOORD2;
                float4 octaframe99 : TEXCOORD3;
                float4 viewPos99 : TEXCOORD4;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
        	};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
        	    UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				float3 vertexValue = Final_VertexPosition890_g76506;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif

				v.normal =  v.normal ;

        	    o.clipPos = TransformObjectToHClip(v.vertex.xyz);
        	    return o;
            }

            half4 frag(VertexOutput IN, out float outDepth : SV_Depth ) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				SurfaceOutput o = (SurfaceOutput)0;
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				

				IN.clipPos.zw = clipPos.zw;

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif
				outDepth = IN.clipPos.z;
                return 0;
            }
            ENDHLSL
        }

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile _ DOTS_INSTANCING_ON
			#define ASE_SRP_VERSION 140007
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_instancing

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
				#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			#endif

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};


			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 UVsFrame199 : TEXCOORD0;
				float4 UVsFrame299 : TEXCOORD1;
				float4 UVsFrame399 : TEXCOORD2;
				float4 octaframe99 : TEXCOORD3;
				float4 viewPos99 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

			VertexOutput vert(VertexInput v)
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				float3 vertexValue = Final_VertexPosition890_g76506;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif

				v.normal =  v.normal ;

				o.clipPos = TransformObjectToHClip(v.vertex.xyz);
				return o;
			}

			void frag(VertexOutput IN
				, out half4 outNormalWS : SV_Target0
				, out float outDepth : SV_Depth
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				)
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				SurfaceOutput o = (SurfaceOutput)0;
				float4 clipPos = 0;
				float3 worldPos = 0;

				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				half3 World_Normal3638_g76506 = o.Normal;
				
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				

				IN.clipPos.zw = clipPos.zw;

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				float3 Normal = World_Normal3638_g76506;
				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif
				outDepth = IN.clipPos.z;

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(Normal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					outNormalWS = half4(NormalizeNormalPerPixel(Normal), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_SRP_VERSION 140007
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#pragma multi_compile_instancing

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos      : SV_POSITION;
				float4 UVsFrame199 : TEXCOORD0;
				float4 UVsFrame299 : TEXCOORD1;
				float4 UVsFrame399 : TEXCOORD2;
				float4 octaframe99 : TEXCOORD3;
				float4 viewPos99 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			int _ObjectId;
			int _PassValue;

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

			VertexOutput vert(VertexInput v)
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				float3 vertexValue = Final_VertexPosition890_g76506;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif

				v.normal =  v.normal ;

				o.clipPos = TransformObjectToHClip(v.vertex.xyz);
				return o;
			}

			half4 frag(VertexOutput IN, out float outDepth : SV_Depth ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				SurfaceOutput o = (SurfaceOutput)0;
				float4 clipPos = 0;
				float3 worldPos = 0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				
				IN.clipPos.zw = clipPos.zw;
				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				outDepth = IN.clipPos.z;
				return float4(_ObjectId, _PassValue, 1.0, 1.0);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _SPECULAR_SETUP 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_SRP_VERSION 140007
			#ifdef UNITY_COLORSPACE_GAMMA//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.220916301, 0.220916301, 0.220916301, 1.0 - 0.220916301)//AI_SRP
			#else//AI_SRP
			#define unity_ColorSpaceDielectricSpec half4(0.04, 0.04, 0.04, 1.0 - 0.04) //AI_SRP
			#endif//AI_SRP
			#define ASE_USING_SAMPLING_MACROS 1


			#pragma vertex vert
			#pragma fragment frag

			#define SCENEPICKINGPASS 1

			#pragma multi_compile_instancing

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ai_ObjectToWorld GetObjectToWorldMatrix()
			#define ai_WorldToObject GetWorldToObjectMatrix()
			#define AI_INV_TWO_PI  INV_TWO_PI
			#define AI_PI          PI
			#define AI_INV_PI      INV_PI
			#define THE_VEGETATION_ENGINE
			#define TVE_IS_UNIVERSAL_PIPELINE
			#define TVE_IS_SUBSURFACE_SHADER
			#define TVE_IS_PLANT_SHADER
			//SHADER INJECTION POINT BEGIN
			//SHADER INJECTION POINT END


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 UVsFrame199 : TEXCOORD2;
				float4 UVsFrame299 : TEXCOORD3;
				float4 UVsFrame399 : TEXCOORD4;
				float4 octaframe99 : TEXCOORD5;
				float4 viewPos99 : TEXCOORD6;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			half4 _SubsurfaceColor;
			float4 _AI_SizeOffset;
			half4 _NoiseMaskRemap;
			half4 _EmissiveColor;
			float4 _SubsurfaceDiffusion_Asset;
			half4 _ImpostorColor;
			half4 _VertexOcclusionColor;
			float3 _AI_Offset;
			half _ImpostorCat;
			float _AI_Parallax;
			float _AI_ImpostorSize;
			float _AI_FramesY;
			float _AI_FramesX;
			float _AI_Frames;
			half _EmissiveMode;
			half _EmissiveIntensityMode;
			half _EmissiveIntensityValue;
			half _MessageOcclusion;
			half _SubsurfaceScatteringValue;
			float _AI_TextureBias;
			float _AI_DepthSize;
			float _AI_Clip;
			float _AI_ShadowView;
			half _SubsurfaceAmbientValue;
			half _MotionPosition_10;
			half _MotionScale_10;
			half _MotionSpeed_10;
			half _MotionAmplitude_10;
			half _GlobalOverlay;
			half _OverlayVariationValue;
			half _OverlayProjectionValue;
			half _VertexOcclusionOverlayMode;
			half _EmissivePhaseValue;
			float _emissive_intensity_value;
			float _render_specular;
			half _ImpostorSmoothnessValue;
			float _AI_ShadowBias;
			half _SubsurfaceShadowValue;
			half _SubsurfaceDirectValue;
			half _SubsurfaceValue;
			float _SubsurfaceDiffusion;
			half _SpaceSubsurface;
			half _SpaceMotionGlobals;
			half _SpaceGlobalOptions;
			half _SpaceGlobalLocals;
			half _VertexPivotMode;
			half _RenderPriority;
			half _RenderQueue;
			half _CategoryOcclusion;
			half _SpaceGlobalLayers;
			half _CategoryGlobal;
			float _IsPlantShader;
			half _IsSubsurfaceShader;
			float _RenderSpecular;
			half _RenderCoverage;
			half _IsTVEShader;
			half _SubsurfaceNormalValue;
			half _HasOcclusion;
			half _IsCollected;
			half _SubsurfaceAngleValue;
			half _IsImpostorShader;
			half _IsInitialized;
			half _VegetationMode;
			half _CategoryNoise;
			half _CategorySubsurface;
			half _CategoryEmissive;
			half _CategoryMotion;
			half _CategorySizeFade;
			half _IsVersion;
			half _VertexVariationMode;
			half _HasEmissive;
			half _HasGradient;
			half _IsCustomShader;
			half _IsShared;
			half _IsIdentifier;
			half _SubsurfaceMaskValue;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			CBUFFER_END

			float4 _SelectionID;

			TEXTURE2D(_Albedo);
			SAMPLER(sampler_Albedo);
			TEXTURE2D(_Normals);
			SAMPLER(sampler_Normals);
			TEXTURE2D(TVE_NoiseTex);
			float3 TVE_WorldOrigin;
			half TVE_NoiseTexTilling;
			half4 TVE_MotionParams;
			half4 TVE_TimeParams;
			SAMPLER(sampler_Linear_Repeat);
			half4 TVE_WindEditor;
			half TVE_MotionValue_10;
			half TVE_IsEnabled;
			half _DisableSRPBatcher;
			TEXTURE2D(_Mask);
			TEXTURE2D(_Emissive);
			SAMPLER(sampler_Mask);
			SAMPLER(sampler_Emissive);


			float2 VectortoOctahedron( float3 N )
			{
				N /= dot( 1.0, abs( N ) );
				if( N.z <= 0 )
				{
				N.xy = ( 1 - abs( N.yx ) ) * ( N.xy >= 0 ? 1.0 : -1.0 );
				}
				return N.xy;
			}
			
			float3 OctahedronToVector( float2 Oct )
			{
				float3 N = float3( Oct, 1.0 - dot( 1.0, abs( Oct ) ) );
				if(N.z< 0 )
				{
				N.xy = ( 1 - abs( N.yx) ) * (N.xy >= 0 ? 1.0 : -1.0 );
				}
				return normalize( N);
			}
			
			inline void RayPlaneIntersectionUV( float3 normal, float3 rayPosition, float3 rayDirection, inout float2 uvs, inout float3 localNormal )
			{
				float lDotN = dot( rayDirection, normal ); 
				float p0l0DotN = dot( -rayPosition, normal );
				float t = p0l0DotN / lDotN;
				float3 p = rayDirection * t + rayPosition;
				float3 upVector = float3( 0, 1, 0 );
				float3 tangent = normalize( cross( upVector, normal ) + float3( -0.001, 0, 0 ) );
				float3 bitangent = cross( tangent, normal );
				float frameX = dot( p, tangent );
				float frameZ = dot( p, bitangent );
				uvs = -float2( frameX, frameZ );
				if( t <= 0.0 )
				uvs = 0;
				float3x3 worldToLocal = float3x3( tangent, bitangent, normal );
				localNormal = normalize( mul( worldToLocal, rayDirection ) );
			}
			
			inline void OctaImpostorVertex( inout float4 vertex, inout float3 normal, inout float4 uvsFrame1, inout float4 uvsFrame2, inout float4 uvsFrame3, inout float4 octaFrame, inout float4 viewPos )
			{
				float2 uvOffset = _AI_SizeOffset.zw;
				float parallax = -_AI_Parallax; 
				float UVscale = _AI_ImpostorSize;
				float framesXY = _AI_Frames;
				float prevFrame = framesXY - 1;
				float3 fractions = 1.0 / float3( framesXY, prevFrame, UVscale );
				float fractionsFrame = fractions.x;
				float fractionsPrevFrame = fractions.y;
				float fractionsUVscale = fractions.z;
				float3 worldOrigin = 0;
				float4 perspective = float4( 0, 0, 0, 1 );
				if( UNITY_MATRIX_P[ 3 ][ 3 ] == 1 ) 
				{
				perspective = float4( 0, 0, 5000, 0 );
				worldOrigin = ai_ObjectToWorld._m03_m13_m23;
				}
				float3 worldCameraPos = worldOrigin + mul( UNITY_MATRIX_I_V, perspective ).xyz;
				float3 objectCameraPosition = mul( ai_WorldToObject, float4( worldCameraPos, 1 ) ).xyz - _AI_Offset.xyz; 
				float3 objectCameraDirection = normalize( objectCameraPosition );
				float3 upVector = float3( 0,1,0 );
				float3 objectHorizontalVector = normalize( cross( objectCameraDirection, upVector ) );
				float3 objectVerticalVector = cross( objectHorizontalVector, objectCameraDirection );
				float2 uvExpansion = vertex.xy;
				float3 billboard = objectHorizontalVector * uvExpansion.x + objectVerticalVector * uvExpansion.y;
				float3 localDir = billboard - objectCameraPosition; 
				float2 frameOcta = VectortoOctahedron( objectCameraDirection.xzy ) * 0.5 + 0.5;
				float2 prevOctaFrame = frameOcta * prevFrame;
				float2 baseOctaFrame = floor( prevOctaFrame );
				float2 fractionOctaFrame = ( baseOctaFrame * fractionsFrame );
				float2 octaFrame1 = ( baseOctaFrame * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa1WorldY = OctahedronToVector( octaFrame1 ).xzy;
				float3 octa1LocalY;
				float2 uvFrame1;
				RayPlaneIntersectionUV( octa1WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame1, /*inout*/ octa1LocalY );
				float2 uvParallax1 = octa1LocalY.xy * fractionsFrame * parallax;
				uvFrame1 = ( uvFrame1 * fractionsUVscale + 0.5 ) * fractionsFrame + fractionOctaFrame;
				uvsFrame1 = float4( uvParallax1, uvFrame1) - float4( 0, 0, uvOffset );
				float2 fractPrevOctaFrame = frac( prevOctaFrame );
				float2 cornerDifference = lerp( float2( 0,1 ) , float2( 1,0 ) , saturate( ceil( ( fractPrevOctaFrame.x - fractPrevOctaFrame.y ) ) ));
				float2 octaFrame2 = ( ( baseOctaFrame + cornerDifference ) * fractionsPrevFrame ) * 2.0 - 1.0;
				float3 octa2WorldY = OctahedronToVector( octaFrame2 ).xzy;
				float3 octa2LocalY;
				float2 uvFrame2;
				RayPlaneIntersectionUV( octa2WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame2, /*inout*/ octa2LocalY );
				float2 uvParallax2 = octa2LocalY.xy * fractionsFrame * parallax;
				uvFrame2 = ( uvFrame2 * fractionsUVscale + 0.5 ) * fractionsFrame + ( ( cornerDifference * fractionsFrame ) + fractionOctaFrame );
				uvsFrame2 = float4( uvParallax2, uvFrame2) - float4( 0, 0, uvOffset );
				float2 octaFrame3 = ( ( baseOctaFrame + 1 ) * fractionsPrevFrame  ) * 2.0 - 1.0;
				float3 octa3WorldY = OctahedronToVector( octaFrame3 ).xzy;
				float3 octa3LocalY;
				float2 uvFrame3;
				RayPlaneIntersectionUV( octa3WorldY, objectCameraPosition, localDir, /*inout*/ uvFrame3, /*inout*/ octa3LocalY );
				float2 uvParallax3 = octa3LocalY.xy * fractionsFrame * parallax;
				uvFrame3 = ( uvFrame3 * fractionsUVscale + 0.5 ) * fractionsFrame + ( fractionOctaFrame + fractionsFrame );
				uvsFrame3 = float4( uvParallax3, uvFrame3) - float4( 0, 0, uvOffset );
				octaFrame = 0;
				octaFrame.xy = prevOctaFrame;
				octaFrame.zw = fractionOctaFrame;
				vertex.xyz = billboard + _AI_Offset.xyz;
				normal.xyz = objectCameraDirection;
				viewPos = 0;
				viewPos.xyz = TransformWorldToView( TransformObjectToWorld( vertex.xyz ) );
			}
			
			half3 ShadowPassCheck54_g76559( half3 True, half3 False )
			{
				half3 result;
				#if defined(SHADERPASS) && (SHADERPASS  == SHADERPASS_SHADOWCASTER)
					result = True;
				#else
					result = False;
				#endif
				return result;
			}
			
			inline void OctaImpostorFragment( inout SurfaceOutput o, out float4 clipPos, out float3 worldPos, float4 uvsFrame1, float4 uvsFrame2, float4 uvsFrame3, float4 octaFrame, float4 interpViewPos, out float4 output0, out float4 output1 )
			{
				float depthBias = -1.0;
				float textureBias = _AI_TextureBias;
				float2 fraction = frac( octaFrame.xy );
				float2 invFraction = 1 - fraction;
				float3 weights;
				weights.x = min( invFraction.x, invFraction.y );
				weights.y = abs( fraction.x - fraction.y );
				weights.z = min( fraction.x, fraction.y );
				float4 parallaxSample1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame1.zw, depthBias );
				float2 parallax1 = ( ( 0.5 - parallaxSample1.a ) * uvsFrame1.xy ) + uvsFrame1.zw;
				float4 parallaxSample2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame2.zw, depthBias );
				float2 parallax2 = ( ( 0.5 - parallaxSample2.a ) * uvsFrame2.xy ) + uvsFrame2.zw;
				float4 parallaxSample3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, uvsFrame3.zw, depthBias );
				float2 parallax3 = ( ( 0.5 - parallaxSample3.a ) * uvsFrame3.xy ) + uvsFrame3.zw;
				float4 albedo1 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax1, textureBias );
				float4 albedo2 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax2, textureBias );
				float4 albedo3 = SAMPLE_TEXTURE2D_BIAS( _Albedo, sampler_Albedo, parallax3, textureBias );
				float4 blendedAlbedo = albedo1 * weights.x + albedo2 * weights.y + albedo3 * weights.z;
				o.Alpha = ( blendedAlbedo.a - _AI_Clip );
				clip( o.Alpha );
				float t = ceil( fraction.x - fraction.y );
				float4 cornerDifference = float4( t, 1 - t, 1, 1 );
				float2 step_1 = ( parallax1 - octaFrame.zw ) * _AI_Frames;
				float4 step23 = ( float4( parallax2, parallax3 ) -  octaFrame.zwzw ) * _AI_Frames - cornerDifference;
				step_1 = step_1 * (1-step_1);
				step23 = step23 * (1-step23);
				float3 steps;
				steps.x = step_1.x * step_1.y;
				steps.y = step23.x * step23.y;
				steps.z = step23.z * step23.w;
				steps = step(-steps, 0);
				float final = dot( steps, weights );
				clip( final - 0.5 );
				o.Albedo = blendedAlbedo.rgb;
				#if defined(AI_HD_RENDERPIPELINE)
				float4 feat1 = _Features.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.Diffusion = feat1.rgb;
				o.Features = feat1.a;
				float4 test1 = _Specular.SampleLevel( SamplerState_Point_Repeat, parallax1, 0);
				o.MetalTangent = test1.b;
				#endif
				float4 normals1 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax1, textureBias );
				float4 normals2 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax2, textureBias );
				float4 normals3 = SAMPLE_TEXTURE2D_BIAS( _Normals, sampler_Normals, parallax3, textureBias );
				float4 blendedNormal = normals1 * weights.x  + normals2 * weights.y + normals3 * weights.z;
				float4 output0a = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax1, textureBias );
				float4 output0b = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax2, textureBias );
				float4 output0c = SAMPLE_TEXTURE2D_BIAS( _Mask, sampler_Mask, parallax3, textureBias );
				output0 = output0a * weights.x  + output0b * weights.y + output0c * weights.z; 
				float4 output1a = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax1, textureBias );
				float4 output1b = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax2, textureBias );
				float4 output1c = SAMPLE_TEXTURE2D_BIAS( _Emissive, sampler_Emissive, parallax3, textureBias );
				output1 = output1a * weights.x  + output1b * weights.y + output1c * weights.z; 
				float3 localNormal = blendedNormal.rgb * 2.0 - 1.0;
				float3 worldNormal = normalize( mul( (float3x3)ai_ObjectToWorld, localNormal ) );
				o.Normal = worldNormal;
				float3 viewPos = interpViewPos.xyz;
				float depthOffset = ( ( parallaxSample1.a * weights.x + parallaxSample2.a * weights.y + parallaxSample3.a * weights.z ) - 0.5 /** 2.0 - 1.0*/ ) /** 0.5*/ * _AI_DepthSize * length( ai_ObjectToWorld[ 2 ].xyz );
				#if ( defined(SHADERPASS) && ((defined(SHADERPASS_SHADOWS) && SHADERPASS == SHADERPASS_SHADOWS) || (defined(SHADERPASS_SHADOWCASTER) && SHADERPASS == SHADERPASS_SHADOWCASTER)) ) || defined(UNITY_PASS_SHADOWCASTER)
				viewPos.z += depthOffset * _AI_ShadowView;
				viewPos.z += -_AI_ShadowBias;
				#else 
				viewPos.z += depthOffset;
				#endif
				worldPos = mul( UNITY_MATRIX_I_V, float4( viewPos.xyz, 1 ) ).xyz;
				clipPos = mul( UNITY_MATRIX_P, float4( viewPos, 1 ) );
				#if defined(UNITY_PASS_SHADOWCASTER) && !defined(SHADERPASS)
				#if UNITY_REVERSED_Z
				clipPos.z = min( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#else
				clipPos.z = max( clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE );
				#endif
				#endif
				clipPos.xyz /= clipPos.w;
				if( UNITY_NEAR_CLIP_VALUE < 0 )
				clipPos = clipPos * 0.5 + 0.5;
			}
			

			VertexOutput vert(VertexInput v)
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				OctaImpostorVertex( v.vertex, v.normal, o.UVsFrame199, o.UVsFrame299, o.UVsFrame399, o.octaframe99, o.viewPos99 );
				float3 worldPosOut99 = mul( UNITY_MATRIX_I_V, float4( o.viewPos99.xyz, 1.0 ) ).xyz;
				float3 WorldPosition4027_g76506 = worldPosOut99;
				float3 worldToObj4970_g76506 = mul( GetWorldToObjectMatrix(), float4( WorldPosition4027_g76506, 1 ) ).xyz;
				float3 VertexPosition3564_g76506 = worldToObj4970_g76506;
				half3 Input_True57_g76559 = VertexPosition3564_g76506;
				half3 True54_g76559 = Input_True57_g76559;
				half3 VertexPos40_g76562 = VertexPosition3564_g76506;
				half3 VertexPos40_g76563 = VertexPos40_g76562;
				float3 appendResult74_g76563 = (float3(VertexPos40_g76563.x , 0.0 , 0.0));
				half3 VertexPosRotationAxis50_g76563 = appendResult74_g76563;
				float3 break84_g76563 = VertexPos40_g76563;
				float3 appendResult81_g76563 = (float3(0.0 , break84_g76563.y , break84_g76563.z));
				half3 VertexPosOtherAxis82_g76563 = appendResult81_g76563;
				float3 WorldPosition_Shifted4972_g76506 = ( WorldPosition4027_g76506 - TVE_WorldOrigin );
				float4x4 break19_g76546 = GetObjectToWorldMatrix();
				float3 appendResult20_g76546 = (float3(break19_g76546[ 0 ][ 3 ] , break19_g76546[ 1 ][ 3 ] , break19_g76546[ 2 ][ 3 ]));
				half3 ObjectData20_g76548 = appendResult20_g76546;
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				half3 WorldData19_g76548 = ase_worldPos;
				#ifdef TVE_FEATURE_BATCHING
				float3 staticSwitch14_g76548 = WorldData19_g76548;
				#else
				float3 staticSwitch14_g76548 = ObjectData20_g76548;
				#endif
				float3 temp_output_114_0_g76546 = staticSwitch14_g76548;
				float3 vertexToFrag4543_g76506 = temp_output_114_0_g76546;
				float3 ObjectPosition4422_g76506 = vertexToFrag4543_g76506;
				float3 ObjectPosition_Shifted4976_g76506 = ( ObjectPosition4422_g76506 - TVE_WorldOrigin );
				float3 lerpResult4934_g76506 = lerp( WorldPosition_Shifted4972_g76506 , ObjectPosition_Shifted4976_g76506 , _MotionPosition_10);
				float3 Motion_10_Position4923_g76506 = lerpResult4934_g76506;
				half3 Input_Position419_g76531 = Motion_10_Position4923_g76506;
				float Input_MotionScale287_g76531 = ( _MotionScale_10 + 0.2 );
				half NoiseTex_Tilling735_g76531 = TVE_NoiseTexTilling;
				float2 temp_output_597_0_g76531 = (( Input_Position419_g76531 * Input_MotionScale287_g76531 * NoiseTex_Tilling735_g76531 * 0.0075 )).xz;
				float2 temp_output_447_0_g76536 = ((TVE_MotionParams).xy*2.0 + -1.0);
				half2 Global_Wind_DirectionWS4464_g76506 = temp_output_447_0_g76536;
				half2 Input_DirectionWS423_g76531 = Global_Wind_DirectionWS4464_g76506;
				float lerpResult128_g76532 = lerp( _TimeParameters.x , ( ( _TimeParameters.x * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				half Input_MotionSpeed62_g76531 = _MotionSpeed_10;
				half Input_MotionVariation284_g76531 = 0.0;
				half Input_GlobalMeshVariation569_g76531 = 0.0;
				float temp_output_630_0_g76531 = ( ( ( lerpResult128_g76532 * Input_MotionSpeed62_g76531 ) + ( Input_MotionVariation284_g76531 * Input_GlobalMeshVariation569_g76531 ) ) * 0.03 );
				float temp_output_607_0_g76531 = frac( temp_output_630_0_g76531 );
				float4 lerpResult590_g76531 = lerp( SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * temp_output_607_0_g76531 ) ), 0.0 ) , SAMPLE_TEXTURE2D_LOD( TVE_NoiseTex, sampler_Linear_Repeat, ( temp_output_597_0_g76531 + ( -Input_DirectionWS423_g76531 * frac( ( temp_output_630_0_g76531 + 0.5 ) ) ) ), 0.0 ) , ( abs( ( temp_output_607_0_g76531 - 0.5 ) ) / 0.5 ));
				half4 Noise_Complex703_g76531 = lerpResult590_g76531;
				float2 temp_output_645_0_g76531 = ((Noise_Complex703_g76531).rg*2.0 + -1.0);
				float2 break650_g76531 = temp_output_645_0_g76531;
				float3 appendResult649_g76531 = (float3(break650_g76531.x , 0.0 , break650_g76531.y));
				float3 ase_parentObjectScale = ( 1.0 / float3( length( GetWorldToObjectMatrix()[ 0 ].xyz ), length( GetWorldToObjectMatrix()[ 1 ].xyz ), length( GetWorldToObjectMatrix()[ 2 ].xyz ) ) );
				half2 Global_Noise_OS4572_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult649_g76531 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Noise_DirectionOS487_g76567 = Global_Noise_OS4572_g76506;
				float2 break448_g76536 = temp_output_447_0_g76536;
				float3 appendResult452_g76536 = (float3(break448_g76536.x , 0.0 , break448_g76536.y));
				half2 Global_Wind_DirectionOS4658_g76506 = (( mul( GetWorldToObjectMatrix(), float4( appendResult452_g76536 , 0.0 ) ).xyz * ase_parentObjectScale )).xz;
				half2 Input_Wind_DirectionOS458_g76567 = Global_Wind_DirectionOS4658_g76506;
				half4 Global_Motion_Params4344_g76506 = TVE_MotionParams;
				float4 break322_g76536 = Global_Motion_Params4344_g76506;
				float lerpResult457_g76536 = lerp( break322_g76536.z , TVE_WindEditor.z , TVE_WindEditor.w);
				float temp_output_459_0_g76536 = ( 1.0 - lerpResult457_g76536 );
				half Global_Wind_Power2223_g76506 = ( 1.0 - ( temp_output_459_0_g76536 * temp_output_459_0_g76536 ) );
				half Input_WindPower449_g76567 = Global_Wind_Power2223_g76506;
				float2 lerpResult516_g76567 = lerp( Input_Noise_DirectionOS487_g76567 , Input_Wind_DirectionOS458_g76567 , ( Input_WindPower449_g76567 * 0.6 ));
				half Mesh_Height1524_g76506 = saturate( ( VertexPosition3564_g76506.y / _AI_Offset.y ) );
				half Input_MeshHeight388_g76567 = Mesh_Height1524_g76506;
				half ObjectData20_g76568 = Input_MeshHeight388_g76567;
				half Input_BoundsHeight390_g76567 = 1.0;
				half WorldData19_g76568 = ( Input_MeshHeight388_g76567 * Input_MeshHeight388_g76567 * Input_BoundsHeight390_g76567 );
				#ifdef TVE_FEATURE_BATCHING
				float staticSwitch14_g76568 = WorldData19_g76568;
				#else
				float staticSwitch14_g76568 = ObjectData20_g76568;
				#endif
				half Final_Motion10_Mask321_g76567 = ( staticSwitch14_g76568 * 2.0 );
				half Motion_10_Amplitude2258_g76506 = _MotionAmplitude_10;
				half Input_BendingAmplitude376_g76567 = Motion_10_Amplitude2258_g76506;
				half Global_MotionValue640_g76567 = TVE_MotionValue_10;
				half2 Final_Bending631_g76567 = ( lerpResult516_g76567 * ( Final_Motion10_Mask321_g76567 * Input_BendingAmplitude376_g76567 * Input_WindPower449_g76567 * Input_WindPower449_g76567 * Global_MotionValue640_g76567 ) );
				float2 break636_g76567 = Final_Bending631_g76567;
				float3 appendResult637_g76567 = (float3(break636_g76567.x , 0.0 , break636_g76567.y));
				half3 Motion_10_Bending190_g76506 = appendResult637_g76567;
				half3 Angle44_g76562 = Motion_10_Bending190_g76506;
				half Angle44_g76563 = (Angle44_g76562).z;
				half3 VertexPos40_g76564 = ( VertexPosRotationAxis50_g76563 + ( VertexPosOtherAxis82_g76563 * cos( Angle44_g76563 ) ) + ( cross( float3(1,0,0) , VertexPosOtherAxis82_g76563 ) * sin( Angle44_g76563 ) ) );
				float3 appendResult74_g76564 = (float3(0.0 , 0.0 , VertexPos40_g76564.z));
				half3 VertexPosRotationAxis50_g76564 = appendResult74_g76564;
				float3 break84_g76564 = VertexPos40_g76564;
				float3 appendResult81_g76564 = (float3(break84_g76564.x , break84_g76564.y , 0.0));
				half3 VertexPosOtherAxis82_g76564 = appendResult81_g76564;
				half Angle44_g76564 = -(Angle44_g76562).x;
				float3 Vertex_Motion_Object833_g76506 = ( VertexPosRotationAxis50_g76564 + ( VertexPosOtherAxis82_g76564 * cos( Angle44_g76564 ) ) + ( cross( float3(0,0,1) , VertexPosOtherAxis82_g76564 ) * sin( Angle44_g76564 ) ) );
				half3 Input_False58_g76559 = Vertex_Motion_Object833_g76506;
				half3 False54_g76559 = Input_False58_g76559;
				half3 localShadowPassCheck54_g76559 = ShadowPassCheck54_g76559( True54_g76559 , False54_g76559 );
				half3 Vertex_Size1741_g76506 = half3(1,1,1);
				float3 Vertex_SizeFade1740_g76506 = half3(1,1,1);
				half IsInitialized3811_g76506 = _IsInitialized;
				float3 lerpResult16_g76558 = lerp( float3(0,0,0) , ( ( ( localShadowPassCheck54_g76559 * Vertex_Size1741_g76506 * Vertex_SizeFade1740_g76506 ) - VertexPosition3564_g76506 ) * IsInitialized3811_g76506 ) , TVE_IsEnabled);
				float3 Final_VertexPosition890_g76506 = ( lerpResult16_g76558 + _DisableSRPBatcher );
				
				float3 vertexValue = Final_VertexPosition890_g76506;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif

				v.normal =  v.normal ;

				o.clipPos = TransformObjectToHClip(v.vertex.xyz);
				return o;
			}

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				SurfaceOutput o = (SurfaceOutput)0;
				float4 clipPos = 0;
				float3 worldPos = 0;
				float4 output0 = 0;
				float4 output1 = 0;
				OctaImpostorFragment( o, clipPos, worldPos, IN.UVsFrame199, IN.UVsFrame299, IN.UVsFrame399, IN.octaframe99, IN.viewPos99, output0, output1 );
				float temp_output_3577_0_g76506 = o.Alpha;
				half Final_Alpha4955_g76506 = temp_output_3577_0_g76506;
				
				IN.clipPos.zw = clipPos.zw;
				float Alpha = Final_Alpha4955_g76506;
				float AlphaClipThreshold = AlphaClipThreshold;

				#if _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}
			ENDHLSL
		}
		
    }
    Fallback "Hidden/InternalErrorShader"
	CustomEditor "TVEShaderLiteGUI"
	
}
/*ASEBEGIN
Version=19202
Node;AmplifyShaderEditor.TexturePropertyNode;101;-1664,-128;Inherit;True;Property;_Mask;Impostor Baked Masks;3;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.AmplifyImpostorNode;99;-1408,-128;Inherit;False;9903;Octahedron;False;True;True;13;17;16;15;5;14;12;8;1;2;11;10;9;7;6;21;18;2;Specular;False;9;0;SAMPLER2D;;False;1;SAMPLER2D;;False;2;SAMPLER2D;;False;3;SAMPLER2D;;False;4;SAMPLER2D;;False;5;SAMPLER2D;;False;6;SAMPLER2D;;False;7;SAMPLER2D;;False;8;SAMPLERSTATE;;False;17;FLOAT4;8;FLOAT4;9;FLOAT4;10;FLOAT4;11;FLOAT4;12;FLOAT4;13;FLOAT4;14;FLOAT4;15;FLOAT3;0;FLOAT3;1;FLOAT3;2;FLOAT3;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT3;7;FLOAT3;16
Node;AmplifyShaderEditor.CommentaryNode;300;-1664,-256;Inherit;False;1279.896;100;Final;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-1664,-640;Half;False;Property;_ImpostorCat;[ Impostor Cat ];0;0;Create;True;0;0;0;True;1;StyledCategory(Impostor Settings, 5, 10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;301;-1664,512;Inherit;False;1279.438;100;Features;0;;0,1,0.5,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;299;-1664,-768;Inherit;False;1282.438;100;Internal;0;;1,0.252,0,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;394;-1664,64;Inherit;True;Property;_Emissive;Impostor Emissive Map;4;1;[NoScaleOffset];Create;False;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;398;-1408,-640;Half;False;Property;_RenderCoverage;Impostor Alpha To Mask;20;1;[Enum];Create;False;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-1152,-640;Inherit;False;Property;_RenderSpecular;Impostor Render Specular;19;1;[Enum];Create;False;0;2;Off;0;On;1;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;392;-576,640;Inherit;False;Compile All Shaders;-1;;76501;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;393;-768,640;Inherit;False;Compile Impostors;-1;;76502;1cfd52e266bd86c47a094d0358cb5b93;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;402;-1664,640;Inherit;False;Define impostor Universal;-1;;76503;ba69d246da7a8ba47a16a174259c237e;0;0;1;FLOAT;529
Node;AmplifyShaderEditor.FunctionNode;404;-1408,640;Inherit;False;Define Lighting Subsurface;136;;76504;77137addbb4a22f4c818adc8782926be;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;403;-1152,640;Inherit;False;Define ShaderType Plant;138;;76505;b458122dd75182d488380bd0f592b9e6;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;406;-640,-128;Float;False;True;-1;2;TVEShaderLiteGUI;0;20;BOXOPHOBIC/The Vegetation Engine Lite/Impostors/Plant Subsurface Lit (Octa);4e5791d7c677cf540a160f0a09e2385a;True;Forward;0;0;Forward;13;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;_RenderCoverage;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;5;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;ImpostorType=Octahedron;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;13;Material Type,InvertActionOnDeselection;1;0;Receive Shadows;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;1;638210015937869197;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;LOD CrossFade;1;0;DOTS Instancing;1;638210015963856850;0;8;True;True;True;False;True;False;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;407;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;ShadowCaster;0;1;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;408;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;DepthOnly;0;2;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;409;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;Meta;0;3;Meta;1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;410;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;DepthNormals;0;4;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;411;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;GBuffer;0;5;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;412;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;413;-640,-128;Float;False;False;-1;2;ASEMaterialInspector;0;1;New Amplify Shader;4e5791d7c677cf540a160f0a09e2385a;True;ScenePickingPass;0;7;ScenePickingPass;1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.FunctionNode;385;-1024,-128;Inherit;False;Base Impostor;22;;76506;47a437226c28ea34bad309b04e5582cd;36,4954,0,4399,1,4400,0,4412,0,4410,1,4447,1,4010,0,3868,1,4338,1,4434,0,4539,1,4336,1,5016,1,4804,1,4920,0,4910,1,3881,1,4831,0,3891,0,4416,0,1745,0,3479,0,5004,0,4987,0,3707,0,4676,1,1742,0,3484,0,860,1,4909,1,2260,1,5014,0,4901,0,4894,1,4911,0,5074,0;7;3592;COLOR;0,0,0,0;False;4370;COLOR;0,0,0,0;False;4918;FLOAT;1;False;3583;FLOAT3;0,0,0;False;3574;FLOAT3;0,0,0;False;3577;FLOAT;0;False;3563;FLOAT3;0,0,0;False;16;FLOAT3;3597;FLOAT3;3594;FLOAT3;4372;FLOAT;4373;FLOAT;3595;FLOAT;4119;FLOAT;3598;FLOAT;3980;FLOAT3;3974;FLOAT;4555;FLOAT;3973;FLOAT;3975;FLOAT;4334;FLOAT;3593;FLOAT;4335;FLOAT3;534
WireConnection;99;0;101;0
WireConnection;99;1;394;0
WireConnection;406;0;385;3597
WireConnection;406;1;385;3594
WireConnection;406;2;385;4372
WireConnection;406;9;385;4119
WireConnection;406;4;385;3598
WireConnection;406;6;385;3593
WireConnection;406;15;385;3974
WireConnection;406;8;385;534
WireConnection;385;3592;99;8
WireConnection;385;4370;99;9
WireConnection;385;3583;99;0
WireConnection;385;3574;99;1
WireConnection;385;3577;99;6
WireConnection;385;3563;99;7
ASEEND*/
//CHKSM=C76BDA326DFD18591B41A08A55437DE35571E44A