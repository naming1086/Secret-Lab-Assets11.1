//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Posterize" {
Properties {
}
SubShader {
 Pass {
  Name "Posterize RGB"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 2020
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = max(abs(u_xlat0.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat0.x = (u_xlatb0.x) ? u_xlat2.x : u_xlat1.x;
    u_xlat0.y = (u_xlatb0.y) ? u_xlat2.y : u_xlat1.y;
    u_xlat0.z = (u_xlatb0.z) ? u_xlat2.z : u_xlat1.z;
    u_xlat0.xyz = u_xlat0.xyz * _Params.www;
    u_xlat0.xyz = floor(u_xlat0.xyz);
    u_xlat9 = _Params.w + -1.0;
    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat9);
    u_xlat1.xyz = u_xlat0.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat1.xyz = max(abs(u_xlat1.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat2.x : u_xlat1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat2.y : u_xlat1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat2.z : u_xlat1.z;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 217
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %68 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpDecorate %68 Location 68 
                                             OpMemberDecorate %119 0 Offset 119 
                                             OpDecorate %119 Block 
                                             OpDecorate %121 DescriptorSet 121 
                                             OpDecorate %121 Binding 121 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %25 = OpTypeVector %6 3 
                                     %26 = OpTypePointer Private %25 
                      Private f32_3* %27 = OpVariable Private 
                                 f32 %31 = OpConstant 3.674022E-40 
                               f32_3 %32 = OpConstantComposite %31 %31 %31 
                                 f32 %37 = OpConstant 3.674022E-40 
                               f32_3 %38 = OpConstantComposite %37 %37 %37 
                                 f32 %43 = OpConstant 3.674022E-40 
                               f32_3 %44 = OpConstantComposite %43 %43 %43 
                                 f32 %46 = OpConstant 3.674022E-40 
                               f32_3 %47 = OpConstantComposite %46 %46 %46 
                      Private f32_3* %49 = OpVariable Private 
                                 f32 %52 = OpConstant 3.674022E-40 
                               f32_3 %53 = OpConstantComposite %52 %52 %52 
                                     %55 = OpTypeBool 
                                     %56 = OpTypeVector %55 3 
                                     %57 = OpTypePointer Private %56 
                     Private bool_3* %58 = OpVariable Private 
                                 f32 %59 = OpConstant 3.674022E-40 
                                 f32 %60 = OpConstant 3.674022E-40 
                               f32_4 %61 = OpConstantComposite %59 %59 %59 %60 
                                     %64 = OpTypeVector %55 4 
                                     %67 = OpTypePointer Output %7 
                       Output f32_4* %68 = OpVariable Output 
                                     %69 = OpTypeInt 32 0 
                                 u32 %70 = OpConstant 3 
                                     %71 = OpTypePointer Private %6 
                                     %74 = OpTypePointer Output %6 
                                 u32 %76 = OpConstant 0 
                                     %77 = OpTypePointer Private %55 
                                     %80 = OpTypePointer Function %6 
                                 u32 %91 = OpConstant 1 
                                u32 %104 = OpConstant 2 
                                    %119 = OpTypeStruct %7 
                                    %120 = OpTypePointer Uniform %119 
           Uniform struct {f32_4;}* %121 = OpVariable Uniform 
                                    %122 = OpTypeInt 32 1 
                                i32 %123 = OpConstant 0 
                                    %124 = OpTypePointer Uniform %7 
                       Private f32* %136 = OpVariable Private 
                                    %137 = OpTypePointer Uniform %6 
                                f32 %140 = OpConstant 3.674022E-40 
                                f32 %151 = OpConstant 3.674022E-40 
                              f32_3 %152 = OpConstantComposite %151 %151 %151 
                                f32 %155 = OpConstant 3.674022E-40 
                              f32_3 %156 = OpConstantComposite %155 %155 %155 
                                f32 %164 = OpConstant 3.674022E-40 
                              f32_3 %165 = OpConstantComposite %164 %164 %164 
                                f32 %171 = OpConstant 3.674022E-40 
                              f32_3 %172 = OpConstantComposite %171 %171 %171 
                                f32 %174 = OpConstant 3.674022E-40 
                              f32_4 %175 = OpConstantComposite %174 %174 %174 %60 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                       Function f32* %81 = OpVariable Function 
                       Function f32* %94 = OpVariable Function 
                      Function f32* %107 = OpVariable Function 
                      Function f32* %182 = OpVariable Function 
                      Function f32* %194 = OpVariable Function 
                      Function f32* %206 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %28 = OpLoad %9 
                               f32_3 %29 = OpVectorShuffle %28 %28 0 1 2 
                               f32_3 %30 = OpExtInst %1 4 %29 
                               f32_3 %33 = OpExtInst %1 40 %30 %32 
                                             OpStore %27 %33 
                               f32_3 %34 = OpLoad %27 
                               f32_3 %35 = OpExtInst %1 30 %34 
                                             OpStore %27 %35 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %39 = OpFMul %36 %38 
                                             OpStore %27 %39 
                               f32_3 %40 = OpLoad %27 
                               f32_3 %41 = OpExtInst %1 29 %40 
                                             OpStore %27 %41 
                               f32_3 %42 = OpLoad %27 
                               f32_3 %45 = OpFMul %42 %44 
                               f32_3 %48 = OpFAdd %45 %47 
                                             OpStore %27 %48 
                               f32_4 %50 = OpLoad %9 
                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                               f32_3 %54 = OpFMul %51 %53 
                                             OpStore %49 %54 
                               f32_4 %62 = OpLoad %9 
                               f32_4 %63 = OpVectorShuffle %62 %62 0 1 2 0 
                              bool_4 %65 = OpFOrdGreaterThanEqual %61 %63 
                              bool_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                             OpStore %58 %66 
                        Private f32* %72 = OpAccessChain %9 %70 
                                 f32 %73 = OpLoad %72 
                         Output f32* %75 = OpAccessChain %68 %70 
                                             OpStore %75 %73 
                       Private bool* %78 = OpAccessChain %58 %76 
                                bool %79 = OpLoad %78 
                                             OpSelectionMerge %83 None 
                                             OpBranchConditional %79 %82 %86 
                                     %82 = OpLabel 
                        Private f32* %84 = OpAccessChain %49 %76 
                                 f32 %85 = OpLoad %84 
                                             OpStore %81 %85 
                                             OpBranch %83 
                                     %86 = OpLabel 
                        Private f32* %87 = OpAccessChain %27 %76 
                                 f32 %88 = OpLoad %87 
                                             OpStore %81 %88 
                                             OpBranch %83 
                                     %83 = OpLabel 
                                 f32 %89 = OpLoad %81 
                        Private f32* %90 = OpAccessChain %9 %76 
                                             OpStore %90 %89 
                       Private bool* %92 = OpAccessChain %58 %91 
                                bool %93 = OpLoad %92 
                                             OpSelectionMerge %96 None 
                                             OpBranchConditional %93 %95 %99 
                                     %95 = OpLabel 
                        Private f32* %97 = OpAccessChain %49 %91 
                                 f32 %98 = OpLoad %97 
                                             OpStore %94 %98 
                                             OpBranch %96 
                                     %99 = OpLabel 
                       Private f32* %100 = OpAccessChain %27 %91 
                                f32 %101 = OpLoad %100 
                                             OpStore %94 %101 
                                             OpBranch %96 
                                     %96 = OpLabel 
                                f32 %102 = OpLoad %94 
                       Private f32* %103 = OpAccessChain %9 %91 
                                             OpStore %103 %102 
                      Private bool* %105 = OpAccessChain %58 %104 
                               bool %106 = OpLoad %105 
                                             OpSelectionMerge %109 None 
                                             OpBranchConditional %106 %108 %112 
                                    %108 = OpLabel 
                       Private f32* %110 = OpAccessChain %49 %104 
                                f32 %111 = OpLoad %110 
                                             OpStore %107 %111 
                                             OpBranch %109 
                                    %112 = OpLabel 
                       Private f32* %113 = OpAccessChain %27 %104 
                                f32 %114 = OpLoad %113 
                                             OpStore %107 %114 
                                             OpBranch %109 
                                    %109 = OpLabel 
                                f32 %115 = OpLoad %107 
                       Private f32* %116 = OpAccessChain %9 %104 
                                             OpStore %116 %115 
                              f32_4 %117 = OpLoad %9 
                              f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                     Uniform f32_4* %125 = OpAccessChain %121 %123 
                              f32_4 %126 = OpLoad %125 
                              f32_3 %127 = OpVectorShuffle %126 %126 3 3 3 
                              f32_3 %128 = OpFMul %118 %127 
                              f32_4 %129 = OpLoad %9 
                              f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                             OpStore %9 %130 
                              f32_4 %131 = OpLoad %9 
                              f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                              f32_3 %133 = OpExtInst %1 8 %132 
                              f32_4 %134 = OpLoad %9 
                              f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                             OpStore %9 %135 
                       Uniform f32* %138 = OpAccessChain %121 %123 %70 
                                f32 %139 = OpLoad %138 
                                f32 %141 = OpFAdd %139 %140 
                                             OpStore %136 %141 
                              f32_4 %142 = OpLoad %9 
                              f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                f32 %144 = OpLoad %136 
                              f32_3 %145 = OpCompositeConstruct %144 %144 %144 
                              f32_3 %146 = OpFDiv %143 %145 
                              f32_4 %147 = OpLoad %9 
                              f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                             OpStore %9 %148 
                              f32_4 %149 = OpLoad %9 
                              f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                              f32_3 %153 = OpFAdd %150 %152 
                                             OpStore %27 %153 
                              f32_3 %154 = OpLoad %27 
                              f32_3 %157 = OpFMul %154 %156 
                                             OpStore %27 %157 
                              f32_3 %158 = OpLoad %27 
                              f32_3 %159 = OpExtInst %1 4 %158 
                              f32_3 %160 = OpExtInst %1 40 %159 %32 
                                             OpStore %27 %160 
                              f32_3 %161 = OpLoad %27 
                              f32_3 %162 = OpExtInst %1 30 %161 
                                             OpStore %27 %162 
                              f32_3 %163 = OpLoad %27 
                              f32_3 %166 = OpFMul %163 %165 
                                             OpStore %27 %166 
                              f32_3 %167 = OpLoad %27 
                              f32_3 %168 = OpExtInst %1 29 %167 
                                             OpStore %27 %168 
                              f32_4 %169 = OpLoad %9 
                              f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              f32_3 %173 = OpFMul %170 %172 
                                             OpStore %49 %173 
                              f32_4 %176 = OpLoad %9 
                              f32_4 %177 = OpVectorShuffle %176 %176 0 1 2 0 
                             bool_4 %178 = OpFOrdGreaterThanEqual %175 %177 
                             bool_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                             OpStore %58 %179 
                      Private bool* %180 = OpAccessChain %58 %76 
                               bool %181 = OpLoad %180 
                                             OpSelectionMerge %184 None 
                                             OpBranchConditional %181 %183 %187 
                                    %183 = OpLabel 
                       Private f32* %185 = OpAccessChain %49 %76 
                                f32 %186 = OpLoad %185 
                                             OpStore %182 %186 
                                             OpBranch %184 
                                    %187 = OpLabel 
                       Private f32* %188 = OpAccessChain %27 %76 
                                f32 %189 = OpLoad %188 
                                             OpStore %182 %189 
                                             OpBranch %184 
                                    %184 = OpLabel 
                                f32 %190 = OpLoad %182 
                        Output f32* %191 = OpAccessChain %68 %76 
                                             OpStore %191 %190 
                      Private bool* %192 = OpAccessChain %58 %91 
                               bool %193 = OpLoad %192 
                                             OpSelectionMerge %196 None 
                                             OpBranchConditional %193 %195 %199 
                                    %195 = OpLabel 
                       Private f32* %197 = OpAccessChain %49 %91 
                                f32 %198 = OpLoad %197 
                                             OpStore %194 %198 
                                             OpBranch %196 
                                    %199 = OpLabel 
                       Private f32* %200 = OpAccessChain %27 %91 
                                f32 %201 = OpLoad %200 
                                             OpStore %194 %201 
                                             OpBranch %196 
                                    %196 = OpLabel 
                                f32 %202 = OpLoad %194 
                        Output f32* %203 = OpAccessChain %68 %91 
                                             OpStore %203 %202 
                      Private bool* %204 = OpAccessChain %58 %104 
                               bool %205 = OpLoad %204 
                                             OpSelectionMerge %208 None 
                                             OpBranchConditional %205 %207 %211 
                                    %207 = OpLabel 
                       Private f32* %209 = OpAccessChain %49 %104 
                                f32 %210 = OpLoad %209 
                                             OpStore %206 %210 
                                             OpBranch %208 
                                    %211 = OpLabel 
                       Private f32* %212 = OpAccessChain %27 %104 
                                f32 %213 = OpLoad %212 
                                             OpStore %206 %213 
                                             OpBranch %208 
                                    %208 = OpLabel 
                                f32 %214 = OpLoad %206 
                        Output f32* %215 = OpAccessChain %68 %104 
                                             OpStore %215 %214 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
 Pass {
  Name "Posterize HSV"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 127140
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1.xyz = max(abs(u_xlat0.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = u_xlat0.xyz * vec3(12.9200001, 12.9200001, 12.9200001);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.00313080009, 0.00313080009, 0.00313080009, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat0.x = (u_xlatb0.y) ? u_xlat2.y : u_xlat1.y;
    u_xlat0.y = (u_xlatb0.z) ? u_xlat2.z : u_xlat1.z;
    u_xlat0.w = (u_xlatb0.x) ? u_xlat2.x : u_xlat1.x;
    u_xlatb1 = u_xlat0.x>=u_xlat0.y;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat1.xxxx * u_xlat3 + u_xlat2;
    u_xlatb2 = u_xlat0.w>=u_xlat1.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat0.wyx;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = u_xlat2.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat5.x = u_xlat1.x * 6.0 + 9.99999975e-05;
    u_xlat4.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat4.x = u_xlat4.x / u_xlat5.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat4.x = abs(u_xlat4.x) * _Params.x;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat5.xyz = _Params.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat4.x / u_xlat5.x;
    u_xlat4.xyz = u_xlat4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat0.x + 9.99999975e-05;
    u_xlat0.x = u_xlat0.x * _Params.z;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / u_xlat5.z;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
    u_xlat1.x = u_xlat1.x * _Params.y;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat5.y;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + vec3(0.0549999997, 0.0549999997, 0.0549999997);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.947867334, 0.947867334, 0.947867334);
    u_xlat1.xyz = max(abs(u_xlat1.xyz), vec3(1.1920929e-07, 1.1920929e-07, 1.1920929e-07));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.4000001, 2.4000001, 2.4000001);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.0773993805, 0.0773993805, 0.0773993805);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.0404499993, 0.0404499993, 0.0404499993, 0.0), u_xlat0.xyzx).xyz;
    SV_Target0.x = (u_xlatb0.x) ? u_xlat2.x : u_xlat1.x;
    SV_Target0.y = (u_xlatb0.y) ? u_xlat2.y : u_xlat1.y;
    SV_Target0.z = (u_xlatb0.z) ? u_xlat2.z : u_xlat1.z;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 430
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %83 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpDecorate %83 Location 83 
                                             OpMemberDecorate %239 0 Offset 239 
                                             OpDecorate %239 Block 
                                             OpDecorate %241 DescriptorSet 241 
                                             OpDecorate %241 Binding 241 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeVector %6 3 
                                 f32 %30 = OpConstant 3.674022E-40 
                               f32_3 %31 = OpConstantComposite %30 %30 %30 
                                 f32 %42 = OpConstant 3.674022E-40 
                               f32_3 %43 = OpConstantComposite %42 %42 %42 
                                 f32 %54 = OpConstant 3.674022E-40 
                               f32_3 %55 = OpConstantComposite %54 %54 %54 
                                 f32 %57 = OpConstant 3.674022E-40 
                               f32_3 %58 = OpConstantComposite %57 %57 %57 
                      Private f32_4* %62 = OpVariable Private 
                                 f32 %65 = OpConstant 3.674022E-40 
                               f32_3 %66 = OpConstantComposite %65 %65 %65 
                                     %70 = OpTypeBool 
                                     %71 = OpTypeVector %70 3 
                                     %72 = OpTypePointer Private %71 
                     Private bool_3* %73 = OpVariable Private 
                                 f32 %74 = OpConstant 3.674022E-40 
                                 f32 %75 = OpConstant 3.674022E-40 
                               f32_4 %76 = OpConstantComposite %74 %74 %74 %75 
                                     %79 = OpTypeVector %70 4 
                                     %82 = OpTypePointer Output %7 
                       Output f32_4* %83 = OpVariable Output 
                                     %84 = OpTypeInt 32 0 
                                 u32 %85 = OpConstant 3 
                                     %86 = OpTypePointer Private %6 
                                     %89 = OpTypePointer Output %6 
                                 u32 %91 = OpConstant 1 
                                     %92 = OpTypePointer Private %70 
                                     %95 = OpTypePointer Function %6 
                                u32 %105 = OpConstant 0 
                                u32 %107 = OpConstant 2 
                      Private bool* %132 = OpVariable Private 
                                f32 %139 = OpConstant 3.674022E-40 
                                f32 %142 = OpConstant 3.674022E-40 
                                f32 %144 = OpConstant 3.674022E-40 
                     Private f32_4* %150 = OpVariable Private 
                      Private bool* %167 = OpVariable Private 
                                    %207 = OpTypePointer Private %26 
                     Private f32_3* %208 = OpVariable Private 
                                f32 %211 = OpConstant 3.674022E-40 
                                f32 %213 = OpConstant 3.674022E-40 
                     Private f32_3* %216 = OpVariable Private 
                                    %239 = OpTypeStruct %7 
                                    %240 = OpTypePointer Uniform %239 
           Uniform struct {f32_4;}* %241 = OpVariable Uniform 
                                    %242 = OpTypeInt 32 1 
                                i32 %243 = OpConstant 0 
                                    %244 = OpTypePointer Uniform %6 
                                    %253 = OpTypePointer Uniform %7 
                              f32_3 %257 = OpConstantComposite %142 %142 %142 
                                f32 %267 = OpConstant 3.674022E-40 
                              f32_3 %268 = OpConstantComposite %139 %144 %267 
                              f32_3 %273 = OpConstantComposite %211 %211 %211 
                                f32 %275 = OpConstant 3.674022E-40 
                              f32_3 %276 = OpConstantComposite %275 %275 %275 
                              f32_3 %333 = OpConstantComposite %139 %139 %139 
                                f32 %339 = OpConstant 3.674022E-40 
                              f32_3 %340 = OpConstantComposite %339 %339 %339 
                                f32 %352 = OpConstant 3.674022E-40 
                              f32_3 %353 = OpConstantComposite %352 %352 %352 
                                f32 %370 = OpConstant 3.674022E-40 
                              f32_3 %371 = OpConstantComposite %370 %370 %370 
                                f32 %382 = OpConstant 3.674022E-40 
                              f32_3 %383 = OpConstantComposite %382 %382 %382 
                                f32 %387 = OpConstant 3.674022E-40 
                              f32_4 %388 = OpConstantComposite %387 %387 %387 %75 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                       Function f32* %96 = OpVariable Function 
                      Function f32* %110 = OpVariable Function 
                      Function f32* %122 = OpVariable Function 
                      Function f32* %395 = OpVariable Function 
                      Function f32* %407 = OpVariable Function 
                      Function f32* %419 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                               f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                               f32_3 %29 = OpExtInst %1 4 %28 
                               f32_3 %32 = OpExtInst %1 40 %29 %31 
                               f32_4 %33 = OpLoad %25 
                               f32_4 %34 = OpVectorShuffle %33 %32 4 5 6 3 
                                             OpStore %25 %34 
                               f32_4 %35 = OpLoad %25 
                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                               f32_3 %37 = OpExtInst %1 30 %36 
                               f32_4 %38 = OpLoad %25 
                               f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                             OpStore %25 %39 
                               f32_4 %40 = OpLoad %25 
                               f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               f32_3 %44 = OpFMul %41 %43 
                               f32_4 %45 = OpLoad %25 
                               f32_4 %46 = OpVectorShuffle %45 %44 4 5 6 3 
                                             OpStore %25 %46 
                               f32_4 %47 = OpLoad %25 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                               f32_3 %49 = OpExtInst %1 29 %48 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                             OpStore %25 %51 
                               f32_4 %52 = OpLoad %25 
                               f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                               f32_3 %56 = OpFMul %53 %55 
                               f32_3 %59 = OpFAdd %56 %58 
                               f32_4 %60 = OpLoad %25 
                               f32_4 %61 = OpVectorShuffle %60 %59 4 5 6 3 
                                             OpStore %25 %61 
                               f32_4 %63 = OpLoad %9 
                               f32_3 %64 = OpVectorShuffle %63 %63 0 1 2 
                               f32_3 %67 = OpFMul %64 %66 
                               f32_4 %68 = OpLoad %62 
                               f32_4 %69 = OpVectorShuffle %68 %67 4 5 6 3 
                                             OpStore %62 %69 
                               f32_4 %77 = OpLoad %9 
                               f32_4 %78 = OpVectorShuffle %77 %77 0 1 2 0 
                              bool_4 %80 = OpFOrdGreaterThanEqual %76 %78 
                              bool_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                             OpStore %73 %81 
                        Private f32* %87 = OpAccessChain %9 %85 
                                 f32 %88 = OpLoad %87 
                         Output f32* %90 = OpAccessChain %83 %85 
                                             OpStore %90 %88 
                       Private bool* %93 = OpAccessChain %73 %91 
                                bool %94 = OpLoad %93 
                                             OpSelectionMerge %98 None 
                                             OpBranchConditional %94 %97 %101 
                                     %97 = OpLabel 
                        Private f32* %99 = OpAccessChain %62 %91 
                                f32 %100 = OpLoad %99 
                                             OpStore %96 %100 
                                             OpBranch %98 
                                    %101 = OpLabel 
                       Private f32* %102 = OpAccessChain %25 %91 
                                f32 %103 = OpLoad %102 
                                             OpStore %96 %103 
                                             OpBranch %98 
                                     %98 = OpLabel 
                                f32 %104 = OpLoad %96 
                       Private f32* %106 = OpAccessChain %9 %105 
                                             OpStore %106 %104 
                      Private bool* %108 = OpAccessChain %73 %107 
                               bool %109 = OpLoad %108 
                                             OpSelectionMerge %112 None 
                                             OpBranchConditional %109 %111 %115 
                                    %111 = OpLabel 
                       Private f32* %113 = OpAccessChain %62 %107 
                                f32 %114 = OpLoad %113 
                                             OpStore %110 %114 
                                             OpBranch %112 
                                    %115 = OpLabel 
                       Private f32* %116 = OpAccessChain %25 %107 
                                f32 %117 = OpLoad %116 
                                             OpStore %110 %117 
                                             OpBranch %112 
                                    %112 = OpLabel 
                                f32 %118 = OpLoad %110 
                       Private f32* %119 = OpAccessChain %9 %91 
                                             OpStore %119 %118 
                      Private bool* %120 = OpAccessChain %73 %105 
                               bool %121 = OpLoad %120 
                                             OpSelectionMerge %124 None 
                                             OpBranchConditional %121 %123 %127 
                                    %123 = OpLabel 
                       Private f32* %125 = OpAccessChain %62 %105 
                                f32 %126 = OpLoad %125 
                                             OpStore %122 %126 
                                             OpBranch %124 
                                    %127 = OpLabel 
                       Private f32* %128 = OpAccessChain %25 %105 
                                f32 %129 = OpLoad %128 
                                             OpStore %122 %129 
                                             OpBranch %124 
                                    %124 = OpLabel 
                                f32 %130 = OpLoad %122 
                       Private f32* %131 = OpAccessChain %9 %85 
                                             OpStore %131 %130 
                       Private f32* %133 = OpAccessChain %9 %105 
                                f32 %134 = OpLoad %133 
                       Private f32* %135 = OpAccessChain %9 %91 
                                f32 %136 = OpLoad %135 
                               bool %137 = OpFOrdGreaterThanEqual %134 %136 
                                             OpStore %132 %137 
                               bool %138 = OpLoad %132 
                                f32 %140 = OpSelect %138 %139 %75 
                       Private f32* %141 = OpAccessChain %25 %105 
                                             OpStore %141 %140 
                       Private f32* %143 = OpAccessChain %62 %107 
                                             OpStore %143 %142 
                       Private f32* %145 = OpAccessChain %62 %85 
                                             OpStore %145 %144 
                              f32_4 %146 = OpLoad %9 
                              f32_2 %147 = OpVectorShuffle %146 %146 1 0 
                              f32_4 %148 = OpLoad %62 
                              f32_4 %149 = OpVectorShuffle %148 %147 4 5 2 3 
                                             OpStore %62 %149 
                              f32_4 %151 = OpLoad %9 
                              f32_2 %152 = OpVectorShuffle %151 %151 0 1 
                              f32_4 %153 = OpLoad %62 
                              f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                              f32_2 %155 = OpFNegate %154 
                              f32_2 %156 = OpFAdd %152 %155 
                              f32_4 %157 = OpLoad %150 
                              f32_4 %158 = OpVectorShuffle %157 %156 4 5 2 3 
                                             OpStore %150 %158 
                       Private f32* %159 = OpAccessChain %150 %107 
                                             OpStore %159 %139 
                       Private f32* %160 = OpAccessChain %150 %85 
                                             OpStore %160 %142 
                              f32_4 %161 = OpLoad %25 
                              f32_4 %162 = OpVectorShuffle %161 %161 0 0 0 0 
                              f32_4 %163 = OpLoad %150 
                              f32_4 %164 = OpFMul %162 %163 
                              f32_4 %165 = OpLoad %62 
                              f32_4 %166 = OpFAdd %164 %165 
                                             OpStore %25 %166 
                       Private f32* %168 = OpAccessChain %9 %85 
                                f32 %169 = OpLoad %168 
                       Private f32* %170 = OpAccessChain %25 %105 
                                f32 %171 = OpLoad %170 
                               bool %172 = OpFOrdGreaterThanEqual %169 %171 
                                             OpStore %167 %172 
                               bool %173 = OpLoad %167 
                                f32 %174 = OpSelect %173 %139 %75 
                       Private f32* %175 = OpAccessChain %62 %105 
                                             OpStore %175 %174 
                              f32_4 %176 = OpLoad %25 
                              f32_3 %177 = OpVectorShuffle %176 %176 0 1 3 
                              f32_4 %178 = OpLoad %9 
                              f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                             OpStore %9 %179 
                              f32_4 %180 = OpLoad %9 
                              f32_3 %181 = OpVectorShuffle %180 %180 3 1 0 
                              f32_4 %182 = OpLoad %25 
                              f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 6 
                                             OpStore %25 %183 
                              f32_4 %184 = OpLoad %9 
                              f32_4 %185 = OpFNegate %184 
                              f32_4 %186 = OpLoad %25 
                              f32_4 %187 = OpFAdd %185 %186 
                                             OpStore %25 %187 
                              f32_4 %188 = OpLoad %62 
                              f32_4 %189 = OpVectorShuffle %188 %188 0 0 0 0 
                              f32_4 %190 = OpLoad %25 
                              f32_4 %191 = OpFMul %189 %190 
                              f32_4 %192 = OpLoad %9 
                              f32_4 %193 = OpFAdd %191 %192 
                                             OpStore %9 %193 
                       Private f32* %194 = OpAccessChain %9 %91 
                                f32 %195 = OpLoad %194 
                       Private f32* %196 = OpAccessChain %9 %85 
                                f32 %197 = OpLoad %196 
                                f32 %198 = OpExtInst %1 37 %195 %197 
                       Private f32* %199 = OpAccessChain %25 %105 
                                             OpStore %199 %198 
                       Private f32* %200 = OpAccessChain %9 %105 
                                f32 %201 = OpLoad %200 
                       Private f32* %202 = OpAccessChain %25 %105 
                                f32 %203 = OpLoad %202 
                                f32 %204 = OpFNegate %203 
                                f32 %205 = OpFAdd %201 %204 
                       Private f32* %206 = OpAccessChain %25 %105 
                                             OpStore %206 %205 
                       Private f32* %209 = OpAccessChain %25 %105 
                                f32 %210 = OpLoad %209 
                                f32 %212 = OpFMul %210 %211 
                                f32 %214 = OpFAdd %212 %213 
                       Private f32* %215 = OpAccessChain %208 %105 
                                             OpStore %215 %214 
                       Private f32* %217 = OpAccessChain %9 %91 
                                f32 %218 = OpLoad %217 
                                f32 %219 = OpFNegate %218 
                       Private f32* %220 = OpAccessChain %9 %85 
                                f32 %221 = OpLoad %220 
                                f32 %222 = OpFAdd %219 %221 
                       Private f32* %223 = OpAccessChain %216 %105 
                                             OpStore %223 %222 
                       Private f32* %224 = OpAccessChain %216 %105 
                                f32 %225 = OpLoad %224 
                       Private f32* %226 = OpAccessChain %208 %105 
                                f32 %227 = OpLoad %226 
                                f32 %228 = OpFDiv %225 %227 
                       Private f32* %229 = OpAccessChain %216 %105 
                                             OpStore %229 %228 
                       Private f32* %230 = OpAccessChain %216 %105 
                                f32 %231 = OpLoad %230 
                       Private f32* %232 = OpAccessChain %9 %107 
                                f32 %233 = OpLoad %232 
                                f32 %234 = OpFAdd %231 %233 
                       Private f32* %235 = OpAccessChain %216 %105 
                                             OpStore %235 %234 
                       Private f32* %236 = OpAccessChain %216 %105 
                                f32 %237 = OpLoad %236 
                                f32 %238 = OpExtInst %1 4 %237 
                       Uniform f32* %245 = OpAccessChain %241 %243 %105 
                                f32 %246 = OpLoad %245 
                                f32 %247 = OpFMul %238 %246 
                       Private f32* %248 = OpAccessChain %216 %105 
                                             OpStore %248 %247 
                       Private f32* %249 = OpAccessChain %216 %105 
                                f32 %250 = OpLoad %249 
                                f32 %251 = OpExtInst %1 8 %250 
                       Private f32* %252 = OpAccessChain %216 %105 
                                             OpStore %252 %251 
                     Uniform f32_4* %254 = OpAccessChain %241 %243 
                              f32_4 %255 = OpLoad %254 
                              f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              f32_3 %258 = OpFAdd %256 %257 
                                             OpStore %208 %258 
                       Private f32* %259 = OpAccessChain %216 %105 
                                f32 %260 = OpLoad %259 
                       Private f32* %261 = OpAccessChain %208 %105 
                                f32 %262 = OpLoad %261 
                                f32 %263 = OpFDiv %260 %262 
                       Private f32* %264 = OpAccessChain %216 %105 
                                             OpStore %264 %263 
                              f32_3 %265 = OpLoad %216 
                              f32_3 %266 = OpVectorShuffle %265 %265 0 0 0 
                              f32_3 %269 = OpFAdd %266 %268 
                                             OpStore %216 %269 
                              f32_3 %270 = OpLoad %216 
                              f32_3 %271 = OpExtInst %1 10 %270 
                                             OpStore %216 %271 
                              f32_3 %272 = OpLoad %216 
                              f32_3 %274 = OpFMul %272 %273 
                              f32_3 %277 = OpFAdd %274 %276 
                                             OpStore %216 %277 
                              f32_3 %278 = OpLoad %216 
                              f32_3 %279 = OpExtInst %1 4 %278 
                              f32_3 %280 = OpFAdd %279 %257 
                                             OpStore %216 %280 
                              f32_3 %281 = OpLoad %216 
                              f32_3 %282 = OpCompositeConstruct %75 %75 %75 
                              f32_3 %283 = OpCompositeConstruct %139 %139 %139 
                              f32_3 %284 = OpExtInst %1 43 %281 %282 %283 
                                             OpStore %216 %284 
                              f32_3 %285 = OpLoad %216 
                              f32_3 %286 = OpFAdd %285 %257 
                                             OpStore %216 %286 
                       Private f32* %287 = OpAccessChain %9 %105 
                                f32 %288 = OpLoad %287 
                                f32 %289 = OpFAdd %288 %213 
                       Private f32* %290 = OpAccessChain %208 %105 
                                             OpStore %290 %289 
                       Private f32* %291 = OpAccessChain %9 %105 
                                f32 %292 = OpLoad %291 
                       Uniform f32* %293 = OpAccessChain %241 %243 %107 
                                f32 %294 = OpLoad %293 
                                f32 %295 = OpFMul %292 %294 
                       Private f32* %296 = OpAccessChain %9 %105 
                                             OpStore %296 %295 
                       Private f32* %297 = OpAccessChain %9 %105 
                                f32 %298 = OpLoad %297 
                                f32 %299 = OpExtInst %1 8 %298 
                       Private f32* %300 = OpAccessChain %9 %105 
                                             OpStore %300 %299 
                       Private f32* %301 = OpAccessChain %9 %105 
                                f32 %302 = OpLoad %301 
                       Private f32* %303 = OpAccessChain %208 %107 
                                f32 %304 = OpLoad %303 
                                f32 %305 = OpFDiv %302 %304 
                       Private f32* %306 = OpAccessChain %9 %105 
                                             OpStore %306 %305 
                       Private f32* %307 = OpAccessChain %25 %105 
                                f32 %308 = OpLoad %307 
                       Private f32* %309 = OpAccessChain %208 %105 
                                f32 %310 = OpLoad %309 
                                f32 %311 = OpFDiv %308 %310 
                       Private f32* %312 = OpAccessChain %25 %105 
                                             OpStore %312 %311 
                       Private f32* %313 = OpAccessChain %25 %105 
                                f32 %314 = OpLoad %313 
                       Uniform f32* %315 = OpAccessChain %241 %243 %91 
                                f32 %316 = OpLoad %315 
                                f32 %317 = OpFMul %314 %316 
                       Private f32* %318 = OpAccessChain %25 %105 
                                             OpStore %318 %317 
                       Private f32* %319 = OpAccessChain %25 %105 
                                f32 %320 = OpLoad %319 
                                f32 %321 = OpExtInst %1 8 %320 
                       Private f32* %322 = OpAccessChain %25 %105 
                                             OpStore %322 %321 
                       Private f32* %323 = OpAccessChain %25 %105 
                                f32 %324 = OpLoad %323 
                       Private f32* %325 = OpAccessChain %208 %91 
                                f32 %326 = OpLoad %325 
                                f32 %327 = OpFDiv %324 %326 
                       Private f32* %328 = OpAccessChain %25 %105 
                                             OpStore %328 %327 
                              f32_4 %329 = OpLoad %25 
                              f32_3 %330 = OpVectorShuffle %329 %329 0 0 0 
                              f32_3 %331 = OpLoad %216 
                              f32_3 %332 = OpFMul %330 %331 
                              f32_3 %334 = OpFAdd %332 %333 
                                             OpStore %216 %334 
                              f32_4 %335 = OpLoad %9 
                              f32_3 %336 = OpVectorShuffle %335 %335 0 0 0 
                              f32_3 %337 = OpLoad %216 
                              f32_3 %338 = OpFMul %336 %337 
                              f32_3 %341 = OpFAdd %338 %340 
                              f32_4 %342 = OpLoad %25 
                              f32_4 %343 = OpVectorShuffle %342 %341 4 5 6 3 
                                             OpStore %25 %343 
                              f32_3 %344 = OpLoad %216 
                              f32_4 %345 = OpLoad %9 
                              f32_3 %346 = OpVectorShuffle %345 %345 0 0 0 
                              f32_3 %347 = OpFMul %344 %346 
                              f32_4 %348 = OpLoad %9 
                              f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                             OpStore %9 %349 
                              f32_4 %350 = OpLoad %25 
                              f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                              f32_3 %354 = OpFMul %351 %353 
                              f32_4 %355 = OpLoad %25 
                              f32_4 %356 = OpVectorShuffle %355 %354 4 5 6 3 
                                             OpStore %25 %356 
                              f32_4 %357 = OpLoad %25 
                              f32_3 %358 = OpVectorShuffle %357 %357 0 1 2 
                              f32_3 %359 = OpExtInst %1 4 %358 
                              f32_3 %360 = OpExtInst %1 40 %359 %31 
                              f32_4 %361 = OpLoad %25 
                              f32_4 %362 = OpVectorShuffle %361 %360 4 5 6 3 
                                             OpStore %25 %362 
                              f32_4 %363 = OpLoad %25 
                              f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                              f32_3 %365 = OpExtInst %1 30 %364 
                              f32_4 %366 = OpLoad %25 
                              f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                             OpStore %25 %367 
                              f32_4 %368 = OpLoad %25 
                              f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                              f32_3 %372 = OpFMul %369 %371 
                              f32_4 %373 = OpLoad %25 
                              f32_4 %374 = OpVectorShuffle %373 %372 4 5 6 3 
                                             OpStore %25 %374 
                              f32_4 %375 = OpLoad %25 
                              f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
                              f32_3 %377 = OpExtInst %1 29 %376 
                              f32_4 %378 = OpLoad %25 
                              f32_4 %379 = OpVectorShuffle %378 %377 4 5 6 3 
                                             OpStore %25 %379 
                              f32_4 %380 = OpLoad %9 
                              f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
                              f32_3 %384 = OpFMul %381 %383 
                              f32_4 %385 = OpLoad %62 
                              f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                             OpStore %62 %386 
                              f32_4 %389 = OpLoad %9 
                              f32_4 %390 = OpVectorShuffle %389 %389 0 1 2 0 
                             bool_4 %391 = OpFOrdGreaterThanEqual %388 %390 
                             bool_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                                             OpStore %73 %392 
                      Private bool* %393 = OpAccessChain %73 %105 
                               bool %394 = OpLoad %393 
                                             OpSelectionMerge %397 None 
                                             OpBranchConditional %394 %396 %400 
                                    %396 = OpLabel 
                       Private f32* %398 = OpAccessChain %62 %105 
                                f32 %399 = OpLoad %398 
                                             OpStore %395 %399 
                                             OpBranch %397 
                                    %400 = OpLabel 
                       Private f32* %401 = OpAccessChain %25 %105 
                                f32 %402 = OpLoad %401 
                                             OpStore %395 %402 
                                             OpBranch %397 
                                    %397 = OpLabel 
                                f32 %403 = OpLoad %395 
                        Output f32* %404 = OpAccessChain %83 %105 
                                             OpStore %404 %403 
                      Private bool* %405 = OpAccessChain %73 %91 
                               bool %406 = OpLoad %405 
                                             OpSelectionMerge %409 None 
                                             OpBranchConditional %406 %408 %412 
                                    %408 = OpLabel 
                       Private f32* %410 = OpAccessChain %62 %91 
                                f32 %411 = OpLoad %410 
                                             OpStore %407 %411 
                                             OpBranch %409 
                                    %412 = OpLabel 
                       Private f32* %413 = OpAccessChain %25 %91 
                                f32 %414 = OpLoad %413 
                                             OpStore %407 %414 
                                             OpBranch %409 
                                    %409 = OpLabel 
                                f32 %415 = OpLoad %407 
                        Output f32* %416 = OpAccessChain %83 %91 
                                             OpStore %416 %415 
                      Private bool* %417 = OpAccessChain %73 %107 
                               bool %418 = OpLoad %417 
                                             OpSelectionMerge %421 None 
                                             OpBranchConditional %418 %420 %424 
                                    %420 = OpLabel 
                       Private f32* %422 = OpAccessChain %62 %107 
                                f32 %423 = OpLoad %422 
                                             OpStore %419 %423 
                                             OpBranch %421 
                                    %424 = OpLabel 
                       Private f32* %425 = OpAccessChain %25 %107 
                                f32 %426 = OpLoad %425 
                                             OpStore %419 %426 
                                             OpBranch %421 
                                    %421 = OpLabel 
                                f32 %427 = OpLoad %419 
                        Output f32* %428 = OpAccessChain %83 %107 
                                             OpStore %428 %427 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}